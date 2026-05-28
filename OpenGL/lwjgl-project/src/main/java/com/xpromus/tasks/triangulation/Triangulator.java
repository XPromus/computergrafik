package com.xpromus.tasks.triangulation;

import com.xpromus.tasks.data.Edge;
import com.xpromus.tasks.data.Point2D;
import com.xpromus.tasks.data.Triangle;

import java.util.List;

//TODO: Implement functions for the triangulator
public class Triangulator {

    /**
     * Take a list of points and create a valid Delaunay triangulation.
     * Create this triangulation using the Bowyer-Watson algorithm.
     * @param point2DS List of points to be triangulated.
     * @return A list of triangles containing the valid triangulation.
     */
    public List<Triangle> Triangulate(List<Point2D> point2DS) {
        return List.of();
    }

    /**
     * Create a triangle, that encloses all points, that should be triangulated.
     * The triangle should be an optimal triangle.
     * @param point2DS List of points, that should be enclosed in the triangle.
     * @return An instance of the triangle class containing the super triangle.
     */
    private Triangle CalculateSuperTriangle(List<Point2D> point2DS) {
        return null;
    }

    /**
     * Find triangles, that contain the new point. Also known as bad triangles.
     * @param point2D The new point, that will be added to the triangulation
     * @param triangles All current triangles, that will be checked.
     * @return All bad triangles, that have been found.
     */
    private List<Triangle> FindBadTriangles(Point2D point2D, List<Triangle> triangles) {
        return List.of();
    }

    /**
     * Create a polygon that represents the outline of all bad triangles.
     * @param badTriangles Bad triangles that were found.
     * @return The outline of all bad triangles as a list of edges.
     */
    private List<Edge> CreatePolygonFromBadTriangles(List<Triangle> badTriangles) {
        return List.of();
    }
}
