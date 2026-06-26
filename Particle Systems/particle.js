const FPS = 60;
const BACKGROUND = "#101010";
const ELEMENT_COLOR = "#50FF50";

console.log(particleCanvas);
particleCanvas.width = 800;
particleCanvas.height = 800;
const ctx = particleCanvas.getContext("2d");

function clear() {
    ctx.fillStyle = BACKGROUND;
    ctx.fillRect(0, 0, particleCanvas.width, particleCanvas.height);
}

function point(x, y) {
    const size = 20;
    ctx.fillStyle = ELEMENT_COLOR;
    ctx.fillRect(x, y, size, size);
}

let dx = 0;
let dy = 0;

function frame() {
    const deltaTime = 1 / FPS;
    dx += 5 * deltaTime;
    dx += 5 * deltaTime;
    clear();
    point(10 + dx, 10 + dy);
    setTimeout(frame, 1000 / FPS);
}

setTimeout(frame, 1000 / FPS);
