package com.xpromus.tasks.data;

public class Point3D {

    private final double x;
    private final double y;
    private final double z;

    public Point3D(double x, double y, double z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getZ() {
        return z;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Point3D other)) {
            return false;
        }

        return other.x == x && other.y == y && other.z == z;
    }

    @Override
    public String toString() {
        return "Point3D{" +
                "x: " + x +
                ", y: " + y +
                ", z: " + z +
                '}';
    }
}
