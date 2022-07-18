#include "model.h"
#include <stdio.h>

Model::Model(Gui* gui) {
    this->gui = gui;
}

void Model::run() {
    printf("running\n");
}