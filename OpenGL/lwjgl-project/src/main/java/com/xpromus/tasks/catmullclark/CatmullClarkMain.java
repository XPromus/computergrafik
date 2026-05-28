package com.xpromus.tasks.catmullclark;

import com.xpromus.engine.Engine;
import com.xpromus.engine.IAppLogic;
import com.xpromus.engine.Window;
import com.xpromus.engine.graph.Render;
import com.xpromus.engine.scene.Scene;

public class CatmullClarkMain implements IAppLogic {

    public static void main(String[] args) {
        var catmullClarkMain = new CatmullClarkMain();
        var engine = new Engine("Catmull Clark", new Window.WindowOptions(), catmullClarkMain);
        engine.start();
    }

    @Override
    public void cleanup() {

    }

    @Override
    public void init(Window window, Scene scene, Render render) {

    }

    @Override
    public void input(Window window, Scene scene, long diffTimeMillis) {

    }

    @Override
    public void update(Window window, Scene scene, long diffTimeMillis) {

    }
}
