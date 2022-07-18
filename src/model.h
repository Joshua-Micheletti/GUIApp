#ifndef GUI_H
#define GUI_H
    #include "gui.h"
#endif

class Model {
    public:
        Gui* gui;
        Model(Gui*);
        void run();
};