package com.xpromus.tasks.delaunytriangulation.data;

public class Point {

    private final double x;
    private final double y;

    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double[] toGL3() {
        return new double[] { x, y, 0 };
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Point other)) {
            return false;
        }

        return other.x == x && other.y == y;
    }
}
