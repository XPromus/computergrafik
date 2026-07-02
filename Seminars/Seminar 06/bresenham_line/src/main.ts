const FPS = 60;
const BACKGROUND = "#101010";
const PIXEL_FILL = 'rgba(71, 237, 20, 1)';

const SIZE = 800;
const NUMBER_OF_PIXELS = 100;
const PIXEL_SIZE = SIZE / NUMBER_OF_PIXELS;

const canvas: HTMLCanvasElement = document.querySelector("#c") as HTMLCanvasElement;
canvas.width = SIZE;
canvas.height = SIZE;

const ctx: CanvasRenderingContext2D = canvas.getContext("2d") as CanvasRenderingContext2D;

function create2DArray<T>(
    rows: number, 
    cols: number, 
    defaultValue: T
): T[][] {
    return Array.from(
        { length: rows }, () => Array(cols).fill(defaultValue)
    );
}

type PixelGrid = boolean[][];
let pixelValues: PixelGrid;

function clearPixels(): PixelGrid {
    return create2DArray<boolean>(NUMBER_OF_PIXELS, NUMBER_OF_PIXELS, false);
}

function renderPixels(
    pixelValues: PixelGrid
) {
    for (let y = 0; y < pixelValues.length; y++) {
        const row = pixelValues[y];
        for (let x = 0; x < row.length; x++) {
            const pixel = row[x];
            ctx.fillStyle = pixel ? PIXEL_FILL : BACKGROUND;
            ctx.fillRect(x * PIXEL_SIZE, y * PIXEL_SIZE, PIXEL_SIZE, PIXEL_SIZE);
        }
    }
}

let index = 0;

function renderFrame() {
    const deltaTime = 1 / FPS;
    pixelValues = clearPixels();

    //SET PIXEL VALUES
    pixelValues[index][index] = true;
    index++;
    if (index >= NUMBER_OF_PIXELS) index = 0;

    renderPixels(pixelValues);
    setTimeout(renderFrame, 1000 / FPS);
}

setTimeout(renderFrame, 1000 / FPS);
