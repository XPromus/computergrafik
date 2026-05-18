package com.xpromus.tasks.delaunytriangulation.util;

import com.xpromus.tasks.delaunytriangulation.data.Point;
import com.xpromus.tasks.delaunytriangulation.data.Triangle;

import java.util.ArrayList;
import java.util.List;

public class MeshConverter {

    public static Mesh ConvertToMesh(
        List<Triangle> triangles
    ) {
        var newMesh = new Mesh();

        var vertices = new ArrayList<Point>();
        var triangleIndices = new int[triangles.size() * 3];

        for (var i = 0; i < triangles.size(); i++) {
            var currentTriangle = triangles.get(i);

            if (!vertices.contains(currentTriangle.getA())) vertices.add(currentTriangle.getA());
            if (!vertices.contains(currentTriangle.getB())) vertices.add(currentTriangle.getB());
            if (!vertices.contains(currentTriangle.getC())) vertices.add(currentTriangle.getC());

            var startIndex = i * 3;
            triangleIndices[startIndex] = vertices.indexOf(currentTriangle.getA());
            triangleIndices[startIndex + 1] = vertices.indexOf(currentTriangle.getB());
            triangleIndices[startIndex + 2] = vertices.indexOf(currentTriangle.getC());
        }

        Point[] pointArray = new Point[vertices.size()];
        for (int i = 0; i < vertices.size(); i++) {
            pointArray[i] = vertices.get(i);
        }

        System.out.println(triangles.size());

        newMesh.setCoordinates(pointArray);
        newMesh.setTriangleIndices(triangleIndices);

        return newMesh;
    }

}
