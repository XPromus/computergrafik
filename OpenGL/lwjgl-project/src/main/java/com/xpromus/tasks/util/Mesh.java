package com.xpromus.tasks.util;

import com.xpromus.tasks.data.Point2D;

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

    public void setCoordinates(Point2D[] point2DS) {
        coordinates = new float[point2DS.length * 3];

        colors = new float[point2DS.length * 3];
        Arrays.fill(colors, 1f);

        for (int i = 0; i < point2DS.length; i++) {
            var startIndex = i * 3;
            coordinates[startIndex] = (float) point2DS[i].getX();
            coordinates[startIndex + 1] = (float) point2DS[i].getY();
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
