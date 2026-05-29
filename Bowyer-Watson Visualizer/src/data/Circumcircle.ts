import type { Triangle } from "three";
import { Point } from "./Point";

export class Circumcircle {
    readonly center: Point;
    readonly radius: number;

    constructor(
        center: Point,
        radius: number
    ) {
        this.center = center;
        this.radius = radius;
    }

    public isPointInCircumcircle(point: Point): boolean {
        const deltaX = point.x - this.center.x;
        const deltaY = point.y - this.center.y;
        const distance = Math.pow(deltaX, 2) + Math.pow(deltaY, 2);
        const radiusSquared = Math.pow(this.radius, 2);
        return distance < radiusSquared;
    }

    public static fromTriangle(triangle: Triangle): Circumcircle {
        const center = Circumcircle.calculateCenter(triangle.a, triangle.b, triangle.c);
        const radius = Circumcircle.calculateRadius(center, triangle.a);
        return new Circumcircle(
            center, radius
        );
    }

    public static fromPoints(a: Point, b: Point, c: Point): Circumcircle {
        const center = Circumcircle.calculateCenter(a, b, c);
        const radius = Circumcircle.calculateRadius(center, a);
        return new Circumcircle(
            center, radius
        );
    }

    private static calculateRadius(center: Point, a: Point): number {
        return Math.sqrt(
            Math.pow(center.x - a.x, 2) + Math.pow(center.y - a.y, 2)
        );
    }

    private static calculateCenter(a: Point, b: Point, c: Point): Point {
        const d = Math.abs(
            2 * (
                ((a.x * (b.y - c.y)) + b.x) * 
                (c.y - a.y + c.x) *
                (a.y - b.y)
            )
        )

        const ux = (
            (Math.pow(a.x, 2) + Math.pow(a.y, 2)) * (b.y - c.y) +
            (Math.pow(b.x, 2) + Math.pow(b.y, 2)) * (c.y - a.y) +
            (Math.pow(c.x, 2) + Math.pow(c.y, 2)) * (a.y - b.y)
        ) / d;

        const uy = (
            (Math.pow(a.x, 2) + Math.pow(a.y, 2)) * (c.y - b.y) +
            (Math.pow(b.x, 2) + Math.pow(b.y, 2)) * (a.y - c.y) +
            (Math.pow(c.x, 2) + Math.pow(c.y, 2)) * (b.y - a.y)
        ) / d;

        return new Point(ux, uy, 0);
    }
}
