import { Vector2 } from "../math/vector2";
import { Color } from "./color";

export class Particle {
	pos: Vector2;
	lifetime: number;
    maxLifetime: number;
	size: number;
	velocity: Vector2;
	color: Color

	constructor(
        maxLifetime: number,
		size:  number,
		velocity: Vector2,
		color: Color
	) {
		this.pos = new Vector2(0, 0);
		this.lifetime = 0;
        this.maxLifetime = maxLifetime;
		this.size = size;
		this.velocity = velocity;
		this.color = color;
	}

	calcAlpha(): number {
		return (this.maxLifetime - this.lifetime) / this.maxLifetime;
	}

	calcNewPos(
		speed: number,
		deltaTime: number
	) {
		this.pos.x += this.velocity.x + speed * deltaTime;
		this.pos.y += this.velocity.y + speed * deltaTime;
	}

	updateColor() {
		this.color.a = this.calcAlpha();
	}
}
