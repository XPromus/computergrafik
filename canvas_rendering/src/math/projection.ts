import { Vector2 } from "./vector2";
import type { Vector3 } from "./vector3";

export class Projection {

    static toScreen(
        point: Vector2, 
        width: number, 
        height: number
    ): Vector2 {
        return new Vector2(
            (point.x + 1) / 2 * width,
            (1 - (point.y + 1) / 2) * height
        );
    }

    static project(point: Vector3): Vector2 {
        return new Vector2(point.x / point.z, point.y / point.z);
    } 

}