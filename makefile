CC = g++
libs = ./libs
options = -std=c++11
src = ./src
bin = ./bin
obj = $(bin)/objects
appName = App
objs = $(obj)/main.o $(obj)/imgui.o $(obj)/imgui_demo.o $(obj)/imgui_draw.o $(obj)/imgui_tables.o $(obj)/imgui_widgets.o $(obj)/imgui_impl_glfw.o $(obj)/imgui_impl_opengl3.o $(obj)/glad.o 

glfwI = $(libs)/glfw/include
glfwL = $(libs)/glfw/lib-mingw
gladI = $(libs)/GLAD/include
glad = $(libs)/GLAD/src
imgui = $(libs)/imgui-1.88

ifeq ($(OS),Windows_NT)
	exec = App.exe
	libraries = -lopengl32 -lglfw3
	run = cd bin && $(exec)
	clean = del .\bin\*.exe && del .\bin\objects\*.o
else
	exec = App
	libraries = -lglfw3 -lGL -ldl -lGLU -lX11 -lpthread -lGLEW
	run = (cd $(bin) && ./$(exec))
	clean = rm ./bin/$(exec) && rm ./bin/objects/*.o
endif


build: makefile $(objs)
	$(CC) -o $(bin)/$(exec) $(objs) -L $(glfwL) $(libraries) $(options)

$(obj)/main.o: makefile $(src)/main.cpp
	$(CC) -c $(src)/main.cpp -o $(obj)/main.o -I $(glfwI) -I $(gladI) -I $(imgui) -I $(imgui)/backends $(options)

$(obj)/imgui.o: makefile $(imgui)/imgui.cpp
	$(CC) -c $(imgui)/imgui.cpp -o $(obj)/imgui.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_demo.o: makefile $(imgui)/imgui_demo.cpp
	$(CC) -c $(imgui)/imgui_demo.cpp -o $(obj)/imgui_demo.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_draw.o: makefile $(imgui)/imgui_draw.cpp
	$(CC) -c $(imgui)/imgui_draw.cpp -o $(obj)/imgui_draw.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_tables.o: makefile $(imgui)/imgui_tables.cpp
	$(CC) -c $(imgui)/imgui_tables.cpp -o $(obj)/imgui_tables.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_widgets.o: makefile $(imgui)/imgui_widgets.cpp
	$(CC) -c $(imgui)/imgui_widgets.cpp -o $(obj)/imgui_widgets.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_impl_glfw.o: makefile $(imgui)/backends/imgui_impl_glfw.cpp
	$(CC) -c $(imgui)/backends/imgui_impl_glfw.cpp -o $(obj)/imgui_impl_glfw.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_impl_opengl3.o: makefile $(imgui)/backends/imgui_impl_opengl3.cpp
	$(CC) -c $(imgui)/backends/imgui_impl_opengl3.cpp -o $(obj)/imgui_impl_opengl3.o -I $(imgui) -I $(glfwI)

$(obj)/glad.o: makefile $(glad)/glad.c
	$(CC) -c $(glad)/glad.c -o $(obj)/glad.o -I $(gladI) $(options)

clean:
	$(clean)

run:
	$(run)
