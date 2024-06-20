#include "raylib.h"
#define  CIMGUI_DEFINE_ENUMS_AND_STRUCTS
#include "cimgui.h"
#include "rlImGui.h"

int main(void) {

    InitWindow(1920, 1080, "Test");
    SetTargetFPS(60);

    rlImGuiSetup(true);

    while(!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(DARKGRAY);

        rlImGuiBegin();
        igShowDemoWindow(NULL);
        rlImGuiEnd();

        DrawFPS(10, 10);

        EndDrawing();
    }

    rlImGuiShutdown();
    CloseWindow();

    return 0;
}
