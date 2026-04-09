package com.xpromus.engine;

import com.xpromus.engine.graph.Render;
import com.xpromus.engine.scene.Scene;

public interface IAppLogic {
    void cleanup();

    void init(Window window, Scene scene, Render render);

    void input(Window window, Scene scene, long diffTimeMillis);

    void update(Window window, Scene scene, long diffTimeMillis);
}
