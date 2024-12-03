#include <atomic>
class OneShotBarrier {
    OneShotBarrier(int expected): expected_(expected), arrived_(0){};


    void Await() {
        if (arrived_.fetch_add(1) != expected_ - 1) {
            while(arrived_.load() != expected_) {
                /* Spin */
            }
        }

    }

    int expected_;
    std::atomic <int> arrived_;
};
