import type { Point } from "./Point";

export class Edge {
    readonly a: Point;
    readonly b: Point;

    constructor(
        a: Point,
        b: Point
    ) {
        this.a = a;
        this.b = b;
    }

    public equals(other: Edge): boolean {
        return this.a.equals(other.a) && this.b.equals(other.b) || this.b.equals(other.a) && this.a.equals(other.b);
    }
}
