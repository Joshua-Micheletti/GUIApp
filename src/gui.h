#ifndef GUI_H
#define GUI_H

#define GLFW_INCLUDE_NONE
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <imgui.h>
#include <imgui_impl_glfw.h>
#include <imgui_impl_opengl3.h>

#include "model.h"
class Model;

class Gui {
    public:
        Gui(GLFWwindow*);
        void loadModel(Model*);
        void draw();
        void destroy();
    
    private:
        Model* model;
        void drawElements();
};

#endif