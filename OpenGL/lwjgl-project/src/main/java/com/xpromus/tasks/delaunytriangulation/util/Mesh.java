package com.xpromus.tasks.delaunytriangulation.util;

import com.xpromus.tasks.delaunytriangulation.data.Point;

import java.util.Arrays;

public class Mesh {

    private float[] coordinates;
    private float[] colors;
    private int[] triangleIndices;

    public Mesh() {

    }

    public float[] getCoordinates() {
        return coordinates;
    }

    public void setCoordinates(Point[] points) {
        coordinates = new float[points.length * 3];

        colors = new float[points.length * 3];
        Arrays.fill(colors, 1f);

        for (int i = 0; i < points.length; i++) {
            var startIndex = i * 3;
            coordinates[startIndex] = (float) points[i].getX();
            coordinates[startIndex + 1] = (float) points[i].getY();
            coordinates[startIndex + 2] = 0f;
        }
    }

    public void setCoordinates(float[] coordinates) {
        this.coordinates = coordinates;
    }

    public int[] getTriangleIndices() {
        return triangleIndices;
    }

    public void setTriangleIndices(int[] triangleIndices) {
        this.triangleIndices = triangleIndices;
    }

    public float[] getColors() {
        return colors;
    }
}
