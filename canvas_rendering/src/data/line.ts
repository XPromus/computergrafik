import type { Vector2 } from "../math/vector2";

export class Line {
    points: Vector2[] = [];

    toPath2D(): Path2D {
        if (this.points.length < 2) {
            throw new Error("Line must have at least two points");
        }

        const newPath = new Path2D();
        newPath.moveTo(this.points[0].x, this.points[0].y);
        for (let i = 1; i < this.points.length; i++) {
            const element = this.points[i];
            newPath.lineTo(element.x, element.y);
        }
        return newPath;
    }

    static linesToPath2D(lines: Line[]): Path2D {
        const newPath = new Path2D();
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            const lineAsPath = line.toPath2D();     
            newPath.addPath(lineAsPath)  
        }
        return newPath;
    }
}
