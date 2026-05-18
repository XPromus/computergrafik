package com.xpromus.tasks.delaunytriangulation.data;

public class Triangle {

    private final Point a;
    private final Point b;
    private final Point c;
    private final Edge[] edges;

    private final Circumcircle circumcircle;

    public Triangle(Point a, Point b, Point c) {
        this.a = a;
        this.b = b;
        this.c = c;

        edges = new Edge[]{
            new Edge(a, b),
            new Edge(b, c),
            new Edge(c, a)
        };

        this.circumcircle = new Circumcircle(a, b, c);
    }

    public Triangle(Edge e, Point p) {
        this.a = e.getA();
        this.b = e.getB();
        this.c = p;

        edges = new Edge[]{
            new Edge(a, b),
            new Edge(b, c),
            new Edge(c, a)
        };

        this.circumcircle = new Circumcircle(a, b, c);
    }

    public Point getA() {
        return a;
    }

    public Point getB() {
        return b;
    }

    public Point getC() {
        return c;
    }

    public Edge[] getEdges() {
        return edges;
    }

    public Circumcircle getCircumcircle() {
        return circumcircle;
    }

    public boolean ContainsVertex(Point p) {
        return a.equals(p) || b.equals(p) || c.equals(p);
    }

    public boolean ContainsEdge(Edge e) {
        for (Edge edge : edges) {
            if (edge.equals(e)) {
                return true;
            }
        }

        return false;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Triangle other)) {
            return false;
        }
        return a.equals(other.getA()) && b.equals(other.getB()) && c.equals(other.getC());
    }
}
