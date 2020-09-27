#include <stdio.h>

namespace Geometria {
    int OFF = 0;           // deslocamento padrao

    class Retangulo {
    public:
        static int WIDTH;  // comprimento padrao
        int x, y, width, height;
        Retangulo (int x) {
            this->x = x;
            this->width = WIDTH;
        }
        int getX () {
            return OFF + x;
        }
    };
    int Retangulo::WIDTH = 100;
}

int main (void) {
    using namespace Geometria;

    Retangulo r1(10);
    printf(">>> R1: x=%d w=%d\n", r1.getX(), r1.width);

    OFF = 50;
    r1.WIDTH = 10;

    Retangulo r2(20);
    printf(">>> R2: x=%d w=%d\n", r2.getX(), r2.width);

    return 0;
}
