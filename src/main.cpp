#define GLFW_INCLUDE_NONE
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <imgui.h>
#include <imgui_impl_glfw.h>
#include <imgui_impl_opengl3.h>
#include <stdio.h>

#ifndef GUI_H
#define GUI_H
    #include "gui.h"
#endif

#ifndef MODEL_H
#define MODEL_H
    #include "model.h"
#endif

#include "controller.h"

static void error_callback(int error, const char* description) {
    fprintf(stderr, "Error: %s\n", description);
}

int main() {
    GLFWwindow* window;
    glfwSetErrorCallback(error_callback);

    if (!glfwInit()) {
        printf("GLFW COULDN'T INITIALIZE\n");
        return(1);
    }

    window = glfwCreateWindow(1280, 720, "GUIApp", NULL, NULL);

    if (!window) {
        glfwTerminate();
        printf("COULD NOT INTIALIZE WINDOW\n");
        return(1);
    }

    glfwSetKeyCallback(window, keyCallback);
    glfwMakeContextCurrent(window);
    gladLoadGL();
    glfwSwapInterval(1);

    Gui gui(window);
    Model model(&gui);

    bool show_demo_window = true;

    while (!glfwWindowShouldClose(window)) {
        int width, height;
        glfwGetFramebufferSize(window, &width, &height);

        glViewport(0, 0, width, height);
        glClear(GL_COLOR_BUFFER_BIT);

        gui.draw();
        model.run();

        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    gui.destroy();

    glfwDestroyWindow(window);
    glfwTerminate();

    return(0);
}