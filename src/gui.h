#define GLFW_INCLUDE_NONE
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <imgui.h>
#include <imgui_impl_glfw.h>
#include <imgui_impl_opengl3.h>

class Gui {
    public:
        Gui(GLFWwindow*);
        void draw();
        void destroy();
    
    private:
        void drawElements();
};