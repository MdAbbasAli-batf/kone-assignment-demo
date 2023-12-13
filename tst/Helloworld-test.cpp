#include "gtest/gtest.h"
#include "Helloworld.h"

TEST(HelloWorld, Greetings) {
	ASSERT_EQ("Hello world", Helloworld::greetings());
}

int main(int argc, char** argv) {
::testing::InitGoogleTest(&argc, argv);
return RUN_ALL_TESTS();
}
