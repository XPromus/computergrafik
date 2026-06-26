const FPS = 60;
const PARTICLE_SIZE = 20;
const BACKGROUND = "#101010";
const ELEMENT_COLOR = 'rgba(71, 237, 20, 1)';

const SPEED = 5;
const MAX_LIFETIME = 500;

particleCanvas.width = 800;
particleCanvas.height = 800;
const ctx = particleCanvas.getContext("2d");

class Vector {
    constructor(
        x, y
    ) {
        this.x = x;
        this.y = y;
    }
}

class Particle {

    lifetime = 0;
    size;
    velocity;
    color;

    constructor(
        x, y, size, velocity, color
    ) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.velocity = velocity;
        this.color = color;
    }

    calcAlpha() {
        return (500 - this.lifetime) / 500;
    }

    calcNewPos(speed, deltaTime) {
        this.x += this.velocity.x + speed * deltaTime;
        this.y += this.velocity.y + speed * deltaTime;
        this.color = "rgba(71, 237, 20, " + this.calcAlpha() + ")";
    }
}

let particles = [];

function clear() {
    ctx.fillStyle = BACKGROUND;
    ctx.fillRect(0, 0, particleCanvas.width, particleCanvas.height)
}

function point(particle) {
    ctx.fillStyle = particle.color;
    ctx.fillRect(particle.x, particle.y, particle.size, particle.size);
}

function createNewParticle() {
    return new Particle(
        0, 
        0, 
        PARTICLE_SIZE * Math.random(),
        new Vector(Math.random(), Math.random()),
        ELEMENT_COLOR
    )
}

function frame() {
    const deltaTime = 1 / FPS;

    particles.push(
        createNewParticle()
    )

    clear();
    for (let i = 0; i < particles.length; i++) {
        point(particles[i]);
        particles[i].calcNewPos(SPEED, deltaTime);
        particles[i].lifetime += 1;
        if (particles[i].lifetime >= MAX_LIFETIME) {
            particles.splice(i, 1);
        }
    }

    setTimeout(frame, 1000 / FPS);
}

setTimeout(frame, 1000 / FPS);
