package com.xpromus;

import com.xpromus.engine.*;
import com.xpromus.engine.graph.*;
import com.xpromus.engine.scene.Scene;

public class Main implements IAppLogic {

    public static void main(String[] args) {
        Main main = new Main();
        Engine gameEng = new Engine("LWJGL Project", new Window.WindowOptions(), main);
        gameEng.start();
    }

    @Override
    public void cleanup() {
        // Nothing to be done yet
    }

    @Override
    public void init(Window window, Scene scene, Render render) {
        float[] positions = new float[]{
            -0.5f, 0.5f, 0.0f,
            -0.5f, -0.5f, 0.0f,
            0.5f, -0.5f, 0.0f,
            0.5f, 0.5f, 0.0f,
        };
        float[] colors = new float[]{
            0.5f, 0.0f, 0.0f,
            0.0f, 0.5f, 0.0f,
            0.0f, 0.0f, 0.5f,
            0.0f, 0.5f, 0.5f,
        };
        int[] indices = new int[]{
            0, 1, 3, 3, 1, 2
        };

        // Point[] points = new Point[]{
        //     new Point(0d, 0d),
        //     new Point(0.9d, 0.9d),
        //     new Point(0.9d, 0d),
        //     new Point(0.5d, -0.5d),
        //     new Point(-0.3d, -0.3d),
        //     new Point(-0.9d, -0.4d),
        //     new Point(-0.9d, 0.8d),
        // };
        // var triangulator = new Triangulator();
        // var triangles = triangulator.Triangulate(List.of(points));
        // var newMesh = MeshConverter.ConvertToMesh(triangles);
        // Mesh mesh = new Mesh(newMesh.getCoordinates(), newMesh.getColors(), newMesh.getTriangleIndices());
        
        Mesh mesh = new Mesh(positions, colors, indices);
        scene.addMesh("quad", mesh);
    }

    @Override
    public void input(Window window, Scene scene, long diffTimeMillis) {
        // Nothing to be done yet
    }

    @Override
    public void update(Window window, Scene scene, long diffTimeMillis) {
        // Nothing to be done yet
    }
}
