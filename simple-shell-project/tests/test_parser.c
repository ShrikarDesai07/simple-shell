#include "parser.h"

#include <stdio.h>
#include <string.h>

static int failures = 0;

static void check(int condition, const char *name) {
    if (condition) {
        printf("PASS: %s\n", name);
    } else {
        printf("FAIL: %s\n", name);
        failures++;
    }
}

int main(void) {
    struct Pipeline p;
    char error[256];

    check(parse_line("echo hello world", &p, error, sizeof(error)) == 0 &&
          p.count == 1 && p.commands[0].argc == 3 &&
          strcmp(p.commands[0].argv[1], "hello") == 0 &&
          strcmp(p.commands[0].argv[2], "world") == 0,
          "basic argument parsing");
    free_pipeline(&p);

    check(parse_line("echo \"hello world\"", &p, error, sizeof(error)) == 0 &&
          p.commands[0].argc == 2 &&
          strcmp(p.commands[0].argv[1], "hello world") == 0,
          "double-quoted argument");
    free_pipeline(&p);

    check(parse_line("printf x | wc -c", &p, error, sizeof(error)) == 0 &&
          p.count == 2 && strcmp(p.commands[1].argv[0], "wc") == 0,
          "pipeline parsing");
    free_pipeline(&p);

    check(parse_line("cat < in.txt > out.txt", &p, error, sizeof(error)) == 0 &&
          strcmp(p.commands[0].input_file, "in.txt") == 0 &&
          strcmp(p.commands[0].output_file, "out.txt") == 0 &&
          p.commands[0].append_output == 0,
          "redirection parsing");
    free_pipeline(&p);

    check(parse_line("echo x >> out.txt", &p, error, sizeof(error)) == 0 &&
          p.commands[0].append_output == 1,
          "append redirection parsing");
    free_pipeline(&p);

    check(parse_line("echo \"unterminated", &p, error, sizeof(error)) != 0,
          "unterminated quote rejected");
    check(parse_line("| ls", &p, error, sizeof(error)) != 0,
          "leading pipe rejected");
    check(parse_line("echo hi |", &p, error, sizeof(error)) != 0,
          "trailing pipe rejected");
    check(parse_line("echo hi & date", &p, error, sizeof(error)) != 0,
          "non-terminal background operator rejected");

    printf("\nParser tests: %d failed\n", failures);
    return failures == 0 ? 0 : 1;
}
