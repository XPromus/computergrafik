import { Color } from "./data/color";
import { Line } from "./data/line";
import { Particle } from "./data/particle";
import { Projection } from "./math/projection";
import { Vector2 } from "./math/vector2";
import { Vector3 } from "./math/vector3";

const FPS: number = 60;

const PARTICLE_SIZE = 20;
const BACKGROUND = "#101010";
let particleColor: Color = new Color("#51ff00");

const SPEED = 5;
const MAX_LIFETIME = 500;

const particleCounter = document.getElementById("numberOfParticles") as HTMLElement;
let running: boolean = false;

const startButton = document.getElementById("startButton") as HTMLElement;
startButton.addEventListener("click", onStartButtonClicked);

const endButton = document.getElementById("stopButton") as HTMLElement;
endButton.addEventListener("click", onStopButtonClicked);

const colorPicker = document.getElementById("particleColor") as HTMLInputElement;
colorPicker.value = particleColor.hex;
colorPicker.addEventListener("change", onParticleColorChanged)

function onStartButtonClicked() {
    running = true;
}

function onStopButtonClicked() {
    running = false;
    reset();
}

function onParticleColorChanged() {
    particleColor.hex = colorPicker.value;
}

const particleCanvas: HTMLCanvasElement = document.getElementById("renderingCanvas") as HTMLCanvasElement;
particleCanvas.width = 800;
particleCanvas.height = 800;
const ctx = particleCanvas.getContext("2d") as CanvasRenderingContext2D;

let particles: Particle[] = [];

const reset = () => {
    particles = [];
}

const clear = () => {
	ctx.fillStyle = BACKGROUND;
	ctx.fillRect(0, 0, particleCanvas.width, particleCanvas.height);
}

const drawParticle = (particle: Particle) => {
	ctx.fillStyle = particle.color.toRGBA();
    ctx.fillRect(particle.pos.x, particle.pos.y, particle.size, particle.size);
}

const drawPoint = (
    point: Vector2,
    size: number
) => {
    ctx.fillStyle = "#ffffff";
    ctx.fillRect(
        point.x - size / 2, 
        point.y - size / 2, 
        size, 
        size
    );
}

const createNewParticle = (): Particle => {
	return new Particle(
		MAX_LIFETIME,
        PARTICLE_SIZE * Math.random(),
        new Vector2(Math.random(), Math.random()),
        particleColor
	)
}

const frame = () => {
	const deltaTime = 1 / FPS;

    clear();

    if (running) {
        particles.push(
            createNewParticle(),
        )
        for (let i = 0; i < particles.length; i++) {
            drawParticle(particles[i]);
            particles[i].calcNewPos(SPEED, deltaTime);
            particles[i].updateColor();
            particles[i].lifetime += 1;
            if (particles[i].lifetime >= MAX_LIFETIME) {
                particles.splice(i, 1);
            }
        }
    }
    
	const line = new Line();
	line.points = [new Vector2(0, 0), new Vector2(600, 500)];
	ctx.strokeStyle = new Color("#2b80ff").hex;
	ctx.lineWidth = 3;
	ctx.stroke(line.toPath2D());

    particleCounter.innerHTML = particles.length.toString();

    const point = new Vector3(0, 0, 2);
    drawPoint(Projection.toScreen(Projection.project(point), particleCanvas.width, particleCanvas.height), 20)

	setTimeout(frame, 1000 / FPS);
}

setTimeout(frame, 1000 / FPS)
