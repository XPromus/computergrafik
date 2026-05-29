import { Edge } from "../data/Edge";
import { Point } from "../data/Point";
import { Triangle } from "../data/Triangle";
import { Trinagulation } from "./Triangulation";

export class Triangulator {

    public static triangulate(
        points: Point[]
    ): Trinagulation {
        if (points.length < 3) {
            return new Trinagulation([]);
        }

        const superTriangle = this.calculateSuperTriangle(points);
        let triangles: Triangle[] = [];
        triangles.push(superTriangle);

        for (const point of points) {
            const badTriangles = this.findBadTriangles(point, triangles);
            const polygon = this.createPolygonFromBadTriangles(badTriangles);
            triangles = this.removeInstancesFromList(triangles, badTriangles);
            for (const edge of polygon) {
                const newTriangle = Triangle.fromEdgeAndPoint(edge, point);
                triangles.push(newTriangle);
            }
        }

        const finalTriangles: Triangle[] = [];
        for (const triangle of triangles) {
            if (
                triangle.containsPoint(superTriangle.a) ||
                triangle.containsPoint(superTriangle.b) ||
                triangle.containsPoint(superTriangle.c)
            ) {
                continue;
            }

            finalTriangles.push(triangle);
        }

        return new Trinagulation(finalTriangles);
    }

    private static calculateSuperTriangle(
        points: Point[]
    ): Triangle {
        const minX = points.reduce((r, e) => r.x < e.x ? r : e).x;
        const maxX = points.reduce((r, e) => r.x > e.x ? r : e).x;
        const minY = points.reduce((r, e) => r.y < e.y ? r : e).y;
        const maxY = points.reduce((r, e) => r.y > e.y ? r : e).y;

        const squareWidth = Math.max(maxX - minX, maxY - minY);

        return new Triangle(
            new Point(minX - 0.5 * squareWidth, minY, 0),
            new Point(minX + 1.5 * squareWidth, minY, 0),
            new Point(minX + 0.5 * squareWidth, minY + 2 * squareWidth, 0)
        );
    }

    private static findBadTriangles(
        point: Point,
        triangles: Triangle[]
    ): Triangle[] {
        const badTriangles: Triangle[] = [];

        for (let index = 0; index < triangles.length; index++) {
            const triangle = triangles[index];

            if (triangle.circumcircle.isPointInCircumcircle(point)) {
                badTriangles.push(triangle);
            }
        }

        return badTriangles;
    }

    private static createPolygonFromBadTriangles(
        badTriangles: Triangle[]
    ): Edge[] {
        const polygon: Edge[] = [];

        for (let index = 0; index < badTriangles.length; index++) {
            const badTriangle = badTriangles[index];
            const trianglesToCheck: Triangle[] = badTriangles;
            trianglesToCheck.splice(index, 1);

            for (let edgeIndex = 0; edgeIndex < badTriangle.edges.length; edgeIndex++) {
                const currentEdge = badTriangle.edges[edgeIndex];
                let sharedEdge = false;
                for (let checkTriangleIndex = 0; checkTriangleIndex < trianglesToCheck.length; checkTriangleIndex++) {
                    const triangleToCheck = trianglesToCheck[checkTriangleIndex];
                    if (triangleToCheck.containsEdge(currentEdge)){
                        sharedEdge = true;
                        break;
                    }
                }

                if (!sharedEdge) {
                    polygon.push(currentEdge);
                }
            }
        }

        return polygon;
    }

    private static removeInstancesFromList(
        listToApplyTo: Triangle[], 
        removeTargets: Triangle[]
    ): Triangle[] {
        const returnList: Triangle[] = [];

        for (const triangle of listToApplyTo) {
            let inBadTriangles = false;

            for (const badTriangle of removeTargets) {
                if (triangle.equals(badTriangle)) {
                    inBadTriangles = true;
                    break;
                }
            }

            if (!inBadTriangles) {
                returnList.push(triangle);
            }
        }

        return returnList;
    }

}
