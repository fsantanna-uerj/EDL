#include <stdio.h>

namespace Geometria
{
    int x = 10;

    class Retangulo {
    public:
        //static int x;
        int x, y, w, h;
        Retangulo () {
            this->x = Geometria::x;
            this->w = 0;
        }
        void setX (int x) {
            this->x = x;
        }
        void setWfromX () {
            this->w = x;
        }
    };
}

int main (void) {
    using namespace Geometria;

    Retangulo r1;
    printf(">>> R1: x=%d w=%d\n", r1.x, r1.w);

    x = 5;

    Retangulo r2;
    printf(">>> R2: x=%d w=%d\n", r2.x, r2.w);

    r1.setX(100);
    printf(">>> R1: x=%d w=%d\n", r1.x, r1.w);

    r2.setWfromX();
    printf(">>> R2: x=%d w=%d\n", r2.x, r2.w);

    return 0;
}
