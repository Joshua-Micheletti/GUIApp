#ifndef MODEL_H
#define MODEL_H

#include "gui.h"
class Gui;

class Model {
    public:
        Gui* gui;
        Model(Gui*);
        void run();
};

#endif