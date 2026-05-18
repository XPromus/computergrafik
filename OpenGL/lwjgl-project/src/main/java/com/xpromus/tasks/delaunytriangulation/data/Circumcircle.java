package com.xpromus.tasks.delaunytriangulation.data;

public class Circumcircle {

    private final Point center;
    private final double radius;

    public Circumcircle(Point center, float radius) {
        this.center = center;
        this.radius = radius;
    }

    public Circumcircle(
        Point a,
        Point b,
        Point c
    ) {
        center = CalculateCenter(a, b, c);
        radius = CalculateRadius(center, a);
    }

    public boolean IsPointInCircumcircle(Point point) {
        var deltaX = point.getX() - center.getX();
        var deltaY = point.getY() - center.getY();
        var distance = Math.pow(deltaX, 2) + Math.pow(deltaY, 2);
        var radiusSquared = Math.pow(radius, 2);

        return distance < radiusSquared;
    }

    private double CalculateRadius(
        Point center,
        Point a
    ) {
        return Math.sqrt(
            Math.pow(center.getX() - a.getX(), 2) + Math.pow(center.getY() - a.getY(), 2)
        );
    }

    private Point CalculateCenter(
        Point a,
        Point b,
        Point c
    ) {
        var d = Math.abs(
            2 * (a.getX() * (b.getY() - c.getY()) + b.getX() *
                (c.getY() - a.getY()) + c.getX() *
                (a.getY() - b.getY()))
        );

        var uX = (
            (Math.pow(a.getX(), 2) + Math.pow(a.getY(), 2)) * (b.getY() - c.getY()) +
            (Math.pow(b.getX(), 2) + Math.pow(b.getY(), 2)) * (c.getY() - a.getY()) +
            (Math.pow(c.getX(), 2) + Math.pow(c.getY(), 2)) * (a.getY() - b.getY())
        ) / d;

        var uY = (
            (Math.pow(a.getX(), 2) + Math.pow(a.getY(), 2)) * (c.getX() - b.getX()) +
            (Math.pow(b.getX(), 2) + Math.pow(b.getY(), 2)) * (a.getX() - c.getX()) +
            (Math.pow(c.getX(), 2) + Math.pow(c.getY(), 2)) * (b.getX() - a.getX())
        ) / d;

        return new Point(uX, uY);
    }

    public Point getCenter() {
        return center;
    }

    public double getRadius() {
        return radius;
    }
}
