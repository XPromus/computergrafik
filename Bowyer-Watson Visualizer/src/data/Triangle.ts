import { Circumcircle } from "./Circumcircle";
import { Edge } from "./Edge";
import type { Point } from "./Point";

export class Triangle {
    readonly a: Point;
    readonly b: Point;
    readonly c: Point;
    readonly edges: Edge[];

    readonly circumcircle: Circumcircle;

    constructor(
        a: Point,
        b: Point,
        c: Point
    ) {
        this.a = a;
        this.b = b;
        this.c = c;

        this.edges = [
            new Edge(a, b),
            new Edge(b, c),
            new Edge(c, a)
        ]

        this.circumcircle = Circumcircle.fromPoints(a, b, c);
    }

    public static fromEdgeAndPoint(
        edge: Edge, 
        point: Point
    ) {
        return new Triangle(edge.a, edge.b, point);
    }

    public containsPoint(point: Point): boolean {
        return this.a.equals(point) || this.b.equals(point) || this.c.equals(point);
    }

    public containsEdge(edge: Edge): boolean {
        if (this.edges.some(item => item.equals(edge))) {
            return true;
        }

        return false;
    }

    public equals(triangle: Triangle): boolean {
        return this.a.equals(triangle.a) && this.b.equals(triangle.b) && this.c.equals(triangle.c); 
    }
}
