package com.xpromus.tasks.data;

public class Edge {

    private Point2D a;
    private Point2D b;
    private double length;

    public Edge(Point2D a, Point2D b) {
        this.a = a;
        this.b = b;
        length = Math.sqrt(
            Math.pow(b.getX() - a.getX(), 2) + Math.pow(b.getY() - a.getY(), 2)
        );
    }

    public Point2D getA() {
        return a;
    }

    public Point2D getB() {
        return b;
    }

    public double getLength() {
        return length;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Edge other)) {
            return false;
        }

        return other.a.equals(a) && other.b.equals(b) ||
                other.a.equals(b) && other.b.equals(a);
    }
}
