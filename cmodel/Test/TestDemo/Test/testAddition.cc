#include <gtest/gtest.h>

#include <iostream>

#include "../src/Addition.hpp"

using namespace std;

TEST(BasicAssertion, twoTimesTow){
  ASSERT_EQ(2*2, 4);
}

TEST(AdditionTest, plus){
  EXPECT_EQ(Addition()(1, 2), 3);
}

