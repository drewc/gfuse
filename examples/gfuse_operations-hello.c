/*
  FUSE: Filesystem in Userspace
  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>

  This program can be distributed under the terms of the GNU GPLv2.
  See the file COPYING.
*/

/** @file
 *
 * minimal example filesystem using high-level API
 *
 * Compile with:
 *
 *     gcc -Wall hello.c `pkg-config fuse3 --cflags --libs` -o hello
 *
 * ## Source code ##
 * \include hello.c
 */


#define FUSE_USE_VERSION 31

#include <fuse.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <stddef.h>
#include <assert.h>
#include <unistd.h>


___SCMOBJ current_gfuse_operations();
void gfuse_operations_init(long int,  struct fuse_conn_info *, struct fuse_config *);
static void *hello_init(struct fuse_conn_info *conn,
			struct fuse_config *cfg)
{

    fprintf(stderr, "Calling gfuse_operations_init \n");
    fflush(stderr);
    gfuse_operations_init(current_gfuse_operations(), conn, cfg);
    fflush(stderr);
    fprintf(stderr, "Finished gfuse_operations_init \n");
	return NULL;
}

static int hello_getattr(const char *path, struct stat *stbuf,
			 struct fuse_file_info *fi)
{
	(void) fi;
	int res = 0;
    char* name = gfuse_file_name();

	memset(stbuf, 0, sizeof(struct stat));
	if (strcmp(path, "/") == 0) {
		stbuf->st_mode = S_IFDIR | 0755;
		stbuf->st_nlink = 2;
	} else if (strcmp(path+1, name) == 0) {
		stbuf->st_mode = S_IFREG | 0444;
		stbuf->st_nlink = 1;
		stbuf->st_size = gfuse_file_size();
	} else
		res = -ENOENT;

	return res;
}

int gfuse_operations_readdir (___SCMOBJ,char*,void*,fuse_fill_dir_t ,int,struct fuse_file_info*,int);

static int hello_readdir(const char *path, void *buf, fuse_fill_dir_t filler, off_t offset, struct fuse_file_info *fi, enum fuse_readdir_flags flags)
{
  int ret = gfuse_operations_readdir(current_gfuse_operations(),
                                     (char *) path, buf, filler, offset, fi, flags);
  return ret;
}

static int hello_open(const char *path, struct fuse_file_info *fi)
{

    char* name = gfuse_file_name();
	if (strcmp(path+1, name) != 0)
		return -ENOENT;

	if ((fi->flags & O_ACCMODE) != O_RDONLY)
		return -EACCES;

	return 0;
}

static int gfuse_operations_read(___SCMOBJ, char *path, char *buf, long unsigned int,  int, struct fuse_file_info*);

static int hello_read(const char *path, char *buf, size_t size, off_t offset, struct fuse_file_info *fi)
{
  int ret = gfuse_operations_read(current_gfuse_operations(),
                       (char *)path, buf, size, offset, fi);
  return ret;

};

static const struct fuse_operations hello_oper = {
	.init           = hello_init,
	.getattr	= hello_getattr,
	.readdir	= hello_readdir,
	.open		= hello_open,
	.read		= hello_read,
};

/*    /\* int out = open("cout.log", O_RDWR|O_CREAT|O_APPEND, 0600); *\/ */
/*    /\*  if (-1 == out) { perror("opening cout.log"); return 255; } *\/ */

/*      int err = open("cerr.log", O_RDWR|O_CREAT|O_APPEND, 0600); */
/*      if (-1 == err) { perror("opening cerr.log"); return 255; } */

/*    /\*  int save_out = dup(fileno(stdout)); *\/ */
/*      int save_err = dup(fileno(stderr)); */

/*    /\*  if (-1 == dup2(out, fileno(stdout))) { perror("cannot redirect stdout"); return 255; } *\/ */
/*      if (-1 == dup2(err, fileno(stderr))) { perror("cannot redirect stderr"); return 255; } */

int _main(int argc, char *argv[])
{
	int ret;
	struct fuse_args args = FUSE_ARGS_INIT(argc, argv);


	/* Parse options */
	if (fuse_opt_parse(&args, NULL, NULL, NULL) == -1) {
		return 1;
    }

	ret = fuse_main(args.argc, args.argv, &hello_oper, NULL);
	fuse_opt_free_args(&args);
	return ret;
}
