package com.xpromus.tasks.delaunytriangulation.data;

public class Edge {

    private Point a;
    private Point b;
    private double length;

    public Edge(Point a, Point b) {
        this.a = a;
        this.b = b;
        length = Math.sqrt(
            Math.pow(b.getX() - a.getX(), 2) + Math.pow(b.getY() - a.getY(), 2)
        );
    }

    public Point getA() {
        return a;
    }

    public Point getB() {
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
