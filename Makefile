LIBS=-l:libraylib.a -l:libimgui.a -lstdc++ -lpthread -lGL -lm -ldl -lrt -lX11
CFLAGS=-Og -ggdb -pipe
INCLUDE=-I./raylib/src -I./cimgui/ -I./rlImGui/ -I./cimgui/imgui/
CC=gcc
CXX=g++
RAYLIB_FLAGS=$(INCLUDE) -I./raylib/src/external/glfw/include -DPLATFORM_DESKTOP -DGRAPHICS_API_OPENGL_33 -D_GLFW_X11 -w $(CFLAGS)

# I dont know what these do, i just added flags until things worked. To be researched further.
IMGUI_FLAGS=-DIMGUI_DISABLE_OBSOLETE_KEYIO -DPLATFORM_DRM -DCIMGUI_USE_GLFW -DIMGUI_DISABLE_OBSOLETE_FUNCTIONS=1 -DIMGUI_DISABLE_FILE_FUNCTIONS

main: main.c junk/libraylib.a junk/libimgui.a
	$(CC) $(CFLAGS) $(INCLUDE) -o main main.c -L./junk/ $(LIBS)

clean:
	rm junk/*.a junk/*.o

# == Raylib == #
junk/raudio.o: raylib/src/raudio.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/raudio.c -o junk/raudio.o

junk/rcore.o: raylib/src/rcore.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rcore.c -o junk/rcore.o

junk/rglfw.o: raylib/src/rglfw.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rglfw.c -o junk/rglfw.o

junk/rmodels.o: raylib/src/rmodels.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rmodels.c -o junk/rmodels.o

junk/rshapes.o: raylib/src/rshapes.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rshapes.c -o junk/rshapes.o

junk/rtext.o: raylib/src/rtext.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rtext.c -o junk/rtext.o

junk/rtextures.o: raylib/src/rtextures.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rtextures.c -o junk/rtextures.o

junk/utils.o: raylib/src/utils.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/utils.c -o junk/utils.o

junk/libraylib.a: junk/raudio.o junk/rcore.o junk/rglfw.o junk/rmodels.o junk/rshapes.o junk/rtext.o junk/rtextures.o junk/utils.o
	ar rcs junk/libraylib.a junk/raudio.o junk/rcore.o junk/rglfw.o junk/rmodels.o junk/rshapes.o junk/rtext.o junk/rtextures.o junk/utils.o
# == Raylib == #

# == ImGui == #
junk/imgui.o: cimgui/imgui/imgui.cpp
	$(CXX) $(CFLAGS) $(IMGUI_FLAGS) $(INCLUDE) -c cimgui/imgui/imgui.cpp -o junk/imgui.o

junk/imgui_demo.o: cimgui/imgui/imgui_demo.cpp
	$(CXX) $(CFLAGS) $(IMGUI_FLAGS) $(INCLUDE) -c cimgui/imgui/imgui_demo.cpp -o junk/imgui_demo.o

junk/imgui_draw.o: cimgui/imgui/imgui_draw.cpp
	$(CXX) $(CFLAGS) $(IMGUI_FLAGS) $(INCLUDE) -c cimgui/imgui/imgui_draw.cpp -o junk/imgui_draw.o

junk/imgui_tables.o: cimgui/imgui/imgui_tables.cpp
	$(CXX) $(CFLAGS) $(IMGUI_FLAGS) $(INCLUDE) -c cimgui/imgui/imgui_tables.cpp -o junk/imgui_tables.o

junk/imgui_widgets.o: cimgui/imgui/imgui_widgets.cpp
	$(CXX) $(CFLAGS) $(IMGUI_FLAGS) $(INCLUDE) -c cimgui/imgui/imgui_widgets.cpp -o junk/imgui_widgets.o

junk/cimgui.o: cimgui/cimgui.cpp
	$(CXX) $(CFLAGS) $(IMGUI_FLAGS) $(INCLUDE) -c cimgui/cimgui.cpp -o junk/cimgui.o

junk/imgui_impl_glfw.o: cimgui/imgui/backends/imgui_impl_glfw.cpp
	$(CXX) $(CFLAGS) $(IMGUI_FLAGS) $(INCLUDE) -I./cimgui/imgui/backends -c cimgui/imgui/backends/imgui_impl_glfw.cpp -o junk/imgui_impl_glfw.o

junk/imgui_impl_opengl3.o: cimgui/imgui/backends/imgui_impl_opengl3.cpp
	$(CXX) $(CFLAGS) $(IMGUI_FLAGS) $(INCLUDE) -I./cimgui/imgui/backends -c cimgui/imgui/backends/imgui_impl_opengl3.cpp -o junk/imgui_impl_opengl3.o

junk/libimgui.a: junk/imgui_widgets.o junk/imgui_tables.o junk/imgui_draw.o junk/imgui_demo.o junk/imgui.o junk/cimgui.o junk/rlImGui.o junk/imgui_impl_glfw.o junk/imgui_impl_opengl3.o
	ar rcs junk/libimgui.a junk/imgui_widgets.o junk/imgui_tables.o junk/imgui_draw.o junk/imgui_demo.o junk/imgui.o junk/cimgui.o junk/rlImGui.o junk/imgui_impl_glfw.o junk/imgui_impl_opengl3.o
# == ImGui == #

# == rlImGui == #
junk/rlImGui.o: rlImGui/rlImGui.cpp
	$(CXX) $(CFLAGS) $(INCLUDE) -c rlImGui/rlImGui.cpp -o junk/rlImGui.o
# == rlImGui == #
