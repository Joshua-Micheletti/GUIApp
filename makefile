CC = g++
libs = ./libs
options = -std=c++11
src = ./src
bin = ./bin
obj = $(bin)/objects
appName = App
objs = $(obj)/main.o $(obj)/gui.o $(obj)/controller.o $(obj)/model.o $(obj)/imgui.o $(obj)/imgui_demo.o $(obj)/imgui_draw.o $(obj)/imgui_tables.o $(obj)/imgui_widgets.o $(obj)/imgui_impl_glfw.o $(obj)/imgui_impl_opengl3.o $(obj)/glad.o 

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
	escape = 
	echo = echo
	noColor = $(escape)[0m
	marks = 
else
	exec = App
	libraries = -lglfw3 -lGL -ldl -lGLU -lX11 -lpthread -lGLEW
	run = (cd $(bin) && ./$(exec))
	clean = rm ./bin/$(exec) && rm ./bin/objects/*.o
	escape = \033
	echo = echo -e
	noColor = $(escape)[0m
	marks = "
endif

$(bin)/$(exec): makefile $(objs)
	@$(echo) $(marks)$(escape)[31mCOMPILING MAIN PROGRAM$(noColor)$(marks)
	$(CC) -o $(bin)/$(exec) $(objs) -L $(glfwL) $(libraries) $(options)
	@$(echo) $(marks)$(escape)[32mDone$(noColor)$(marks)

$(obj)/main.o: makefile $(src)/main.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING MAIN (SOURCE)$(noColor)$(marks)
	$(CC) -c $(src)/main.cpp -o $(obj)/main.o -I $(glfwI) -I $(gladI) -I $(imgui) -I $(imgui)/backends $(options)

$(obj)/gui.o: makefile $(src)/gui.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING GUI (SOURCE)$(noColor)$(marks)
	$(CC) -c $(src)/gui.cpp -o $(obj)/gui.o -I $(glfwI) -I $(gladI) -I $(imgui) -I $(imgui)/backends $(options)

$(obj)/controller.o: makefile $(src)/controller.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING CONTROLLER (SOURCE)$(noColor)$(marks)
	$(CC) -c $(src)/controller.cpp -o $(obj)/controller.o -I $(glfwI) -I $(gladI) -I $(imgui) -I $(imgui)/backends $(options)

$(obj)/model.o: makefile $(src)/model.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING MODEL (SOURCE)$(noColor)$(marks)
	$(CC) -c $(src)/model.cpp -o $(obj)/model.o -I $(glfwI) -I $(gladI) -I $(imgui) -I $(imgui)/backends $(options)

$(obj)/imgui.o: makefile $(imgui)/imgui.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING IMGUI (LIB)$(noColor)$(marks)
	$(CC) -c $(imgui)/imgui.cpp -o $(obj)/imgui.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_demo.o: makefile $(imgui)/imgui_demo.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING IMGUI DEMO (LIB)$(noColor)$(marks)
	$(CC) -c $(imgui)/imgui_demo.cpp -o $(obj)/imgui_demo.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_draw.o: makefile $(imgui)/imgui_draw.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING IMGUI DRAW (LIB)$(noColor)$(marks)
	$(CC) -c $(imgui)/imgui_draw.cpp -o $(obj)/imgui_draw.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_tables.o: makefile $(imgui)/imgui_tables.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING IMGUI TABLES (LIB)$(noColor)$(marks)
	$(CC) -c $(imgui)/imgui_tables.cpp -o $(obj)/imgui_tables.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_widgets.o: makefile $(imgui)/imgui_widgets.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING IMGUI WIDGETS (LIB)$(noColor)$(marks)
	$(CC) -c $(imgui)/imgui_widgets.cpp -o $(obj)/imgui_widgets.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_impl_glfw.o: makefile $(imgui)/backends/imgui_impl_glfw.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING IMGUI BACKEND GLFW (LIB)$(noColor)$(marks)
	$(CC) -c $(imgui)/backends/imgui_impl_glfw.cpp -o $(obj)/imgui_impl_glfw.o -I $(imgui) -I $(glfwI)

$(obj)/imgui_impl_opengl3.o: makefile $(imgui)/backends/imgui_impl_opengl3.cpp
	@$(echo) $(marks)$(escape)[31mCOMPILING IMGUI BACKEND OPENGL3 (LIB)$(noColor)$(marks)
	$(CC) -c $(imgui)/backends/imgui_impl_opengl3.cpp -o $(obj)/imgui_impl_opengl3.o -I $(imgui) -I $(glfwI)

$(obj)/glad.o: makefile $(glad)/glad.c
	@$(echo) $(marks)$(escape)[31mCOMPILING GLAD (LIB)$(noColor)$(marks)
	$(CC) -c $(glad)/glad.c -o $(obj)/glad.o -I $(gladI) $(options)

clean:
	@$(clean)

run:
	@$(run)
