#include <iostream>
#include <co/fastring.h>

#ifdef _WIN32
#include <windows.h>
#endif

int main(int argc, char ** argv)
{
  fastring out = "hello world";
  std::cout << out << std::endl;

#ifdef _WIN32
  MessageBoxA(NULL, out.c_str(), "Hello Box", MB_OK);
#endif
  return 0;
}
