#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "swiftmc" ? 0 : 1;
}
