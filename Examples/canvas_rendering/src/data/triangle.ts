import { Vector3 } from "../math/vector3";
import { Line } from "./line";

export class Triangle {
    readonly points: Vector3[] = new Array(3);
    readonly lines: Line[] = new Array(3);

    update() {
        this.points[0] = new Vector3(0, 0, 0);
    }

    toPath2D(): Path2D {
        return Line.linesToPath2D(this.lines)
    }
}
