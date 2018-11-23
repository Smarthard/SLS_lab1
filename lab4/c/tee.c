
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <errno.h>

#define BUFSIZE 512

const char *OPTIONS = "ai";

static void dummy_handler() {} 

int main(int argc, char **argv)
{
	FILE **fds = NULL;
	char *frights = "w+";

	int opt;
	int optc = 0;
	while ( (opt = getopt(argc, argv, OPTIONS)) > -1)
	{
		optc++;
		switch(opt)
		{
			case 'a':
				frights = "a+";
				break;
			case 'i':
				signal(SIGINT, dummy_handler);
				break;
		}
	}
	fds = (FILE **) calloc(argc - optc - 1, sizeof(FILE *));
	
	int missed = 1; // missing argv[0]
	for (int i = 1; i < argc; i++)
	{	
		if (strcmp(argv[i], "-a") != 0 && strcmp(argv[i], "-i") != 0)
		{
			fds[i - missed] = fopen(argv[i], frights);

			if (fds[i - missed] == NULL)
			{
			    perror(strerror(errno));
			}
		}
		else
		{
			missed++;
		}

	}

	char idata[BUFSIZE];
	for (;;)
	{
		size_t bytes = fread(idata, 1, sizeof(idata), stdin);

		if (bytes > 0)
		{
			fwrite(idata, 1, bytes, stdout);

			for (int i = 0; i < argc - optc - 1; i++)
			{
				if (fds[i] != NULL)
				{
					fwrite(idata, 1, bytes, fds[i]);
				}
			}
		}
		else
		{
			break;
		}
	}

	for (int i = 1; i < argc - optc - 1; i++)
	{
		fclose(fds[i]);
	}

	return EXIT_SUCCESS;
}
