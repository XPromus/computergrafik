export class Color {
    hex: string;
    a: number;

    constructor(
        hex: string
    ) {
        this.hex = hex;
        this.a = 1;
    }

    toRGBA(): string {
        const hexValue = this.hex.split("#");
        const colorHexValues: string[] = hexValue[hexValue.length - 1].match(/.{1,2}/g) ?? [];
        const deciValues: number[] = colorHexValues.map((value) => {
            return parseInt("0x" + value, 16);
        })
        return `rgba(${deciValues[0]}, ${deciValues[1]}, ${deciValues[2]}, ${this.a})`
    }
}