(export #t)
(def c2ffi-libfuse '(

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_opt.h:77:8
(struct fuse_opt
  (templ (:pointer :char))
  (offset :unsigned-long)
  (value :int))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_opt.h:109:8
(struct fuse_args
  (argc :int)
  (argv (:pointer (:pointer :char)))
  (allocated :int))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_opt.h:180:15
(typedef fuse_opt_proc_t :function-pointer)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_opt.h:203:5
(function "fuse_opt_parse" ((args (:pointer (:struct fuse_args))) (data (:pointer :void)) (opts (:pointer (:struct fuse_opt))) (proc fuse_opt_proc_t)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_opt.h:213:5
(function "fuse_opt_add_opt" ((opts (:pointer (:pointer :char))) (opt (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_opt.h:222:5
(function "fuse_opt_add_opt_escaped" ((opts (:pointer (:pointer :char))) (opt (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_opt.h:231:5
(function "fuse_opt_add_arg" ((args (:pointer (:struct fuse_args))) (arg (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_opt.h:246:5
(function "fuse_opt_insert_arg" ((args (:pointer (:struct fuse_args))) (pos :int) (arg (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_opt.h:255:6
(function "fuse_opt_free_args" ((args (:pointer (:struct fuse_args)))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_opt.h:265:5
(function "fuse_opt_match" ((opts (:pointer (:struct fuse_opt))) (opt (:pointer :char))) :int)

;; /gnu/store/sx7csjb8s1paga5icbmrhxy0rq2a8gqk-clang-11.0.0/lib/clang/11.0.0/include/stdarg.h:14:27
(typedef va_list __builtin_va_list)

;; /gnu/store/sx7csjb8s1paga5icbmrhxy0rq2a8gqk-clang-11.0.0/lib/clang/11.0.0/include/stdarg.h:32:27
(typedef __gnuc_va_list __builtin_va_list)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_log.h:28:6
(enum fuse_log_level
    (FUSE_LOG_EMERG 0)
    (FUSE_LOG_ALERT 1)
    (FUSE_LOG_CRIT 2)
    (FUSE_LOG_ERR 3)
    (FUSE_LOG_WARNING 4)
    (FUSE_LOG_NOTICE 5)
    (FUSE_LOG_INFO 6)
    (FUSE_LOG_DEBUG 7))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_log.h:52:16
(typedef fuse_log_func_t :function-pointer)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_log.h:68:6
(function "fuse_set_log_func" ((func fuse_log_func_t)) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_log.h:76:6
(function "fuse_log" ((level (:enum fuse_log_level)) (fmt (:pointer :char))) :void :variadic)

;; /home/drewc/.guix-profile/include/bits/types.h:31:23
(typedef __u_char :unsigned-char)

;; /home/drewc/.guix-profile/include/bits/types.h:32:28
(typedef __u_short :unsigned-short)

;; /home/drewc/.guix-profile/include/bits/types.h:33:22
(typedef __u_int :unsigned-int)

;; /home/drewc/.guix-profile/include/bits/types.h:34:27
(typedef __u_long :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:37:21
(typedef __int8_t :signed-char)

;; /home/drewc/.guix-profile/include/bits/types.h:38:23
(typedef __uint8_t :unsigned-char)

;; /home/drewc/.guix-profile/include/bits/types.h:39:26
(typedef __int16_t :short)

;; /home/drewc/.guix-profile/include/bits/types.h:40:28
(typedef __uint16_t :unsigned-short)

;; /home/drewc/.guix-profile/include/bits/types.h:41:20
(typedef __int32_t :int)

;; /home/drewc/.guix-profile/include/bits/types.h:42:22
(typedef __uint32_t :unsigned-int)

;; /home/drewc/.guix-profile/include/bits/types.h:44:25
(typedef __int64_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:45:27
(typedef __uint64_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:52:18
(typedef __int_least8_t __int8_t)

;; /home/drewc/.guix-profile/include/bits/types.h:53:19
(typedef __uint_least8_t __uint8_t)

;; /home/drewc/.guix-profile/include/bits/types.h:54:19
(typedef __int_least16_t __int16_t)

;; /home/drewc/.guix-profile/include/bits/types.h:55:20
(typedef __uint_least16_t __uint16_t)

;; /home/drewc/.guix-profile/include/bits/types.h:56:19
(typedef __int_least32_t __int32_t)

;; /home/drewc/.guix-profile/include/bits/types.h:57:20
(typedef __uint_least32_t __uint32_t)

;; /home/drewc/.guix-profile/include/bits/types.h:58:19
(typedef __int_least64_t __int64_t)

;; /home/drewc/.guix-profile/include/bits/types.h:59:20
(typedef __uint_least64_t __uint64_t)

;; /home/drewc/.guix-profile/include/bits/types.h:63:18
(typedef __quad_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:64:27
(typedef __u_quad_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:72:18
(typedef __intmax_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:73:27
(typedef __uintmax_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:145:25
(typedef __dev_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:146:25
(typedef __uid_t :unsigned-int)

;; /home/drewc/.guix-profile/include/bits/types.h:147:25
(typedef __gid_t :unsigned-int)

;; /home/drewc/.guix-profile/include/bits/types.h:148:25
(typedef __ino_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:149:27
(typedef __ino64_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:150:26
(typedef __mode_t :unsigned-int)

;; /home/drewc/.guix-profile/include/bits/types.h:151:27
(typedef __nlink_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:152:25
(typedef __off_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:153:27
(typedef __off64_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:154:25
(typedef __pid_t :int)

;; /home/drewc/.guix-profile/include/bits/types.h:155:26
(typedef __fsid_t ;; /home/drewc/.guix-profile/include/bits/types.h:155:12 <Spelling=/home/drewc/.guix-profile/include/bits/typesizes.h:72:24>
(struct :id 3
    (__val (:array :int 2))))

;; /home/drewc/.guix-profile/include/bits/types.h:156:27
(typedef __clock_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:157:26
(typedef __rlim_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:158:28
(typedef __rlim64_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:159:24
(typedef __id_t :unsigned-int)

;; /home/drewc/.guix-profile/include/bits/types.h:160:26
(typedef __time_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:161:30
(typedef __useconds_t :unsigned-int)

;; /home/drewc/.guix-profile/include/bits/types.h:162:31
(typedef __suseconds_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:164:27
(typedef __daddr_t :int)

;; /home/drewc/.guix-profile/include/bits/types.h:165:25
(typedef __key_t :int)

;; /home/drewc/.guix-profile/include/bits/types.h:168:29
(typedef __clockid_t :int)

;; /home/drewc/.guix-profile/include/bits/types.h:171:27
(typedef __timer_t (:pointer :void))

;; /home/drewc/.guix-profile/include/bits/types.h:174:29
(typedef __blksize_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:179:28
(typedef __blkcnt_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:180:30
(typedef __blkcnt64_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:183:30
(typedef __fsblkcnt_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:184:32
(typedef __fsblkcnt64_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:187:30
(typedef __fsfilcnt_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:188:32
(typedef __fsfilcnt64_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:191:28
(typedef __fsword_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:193:27
(typedef __ssize_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:196:33
(typedef __syscall_slong_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:198:33
(typedef __syscall_ulong_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/types.h:202:19
(typedef __loff_t __off64_t)

;; /home/drewc/.guix-profile/include/bits/types.h:203:15
(typedef __caddr_t (:pointer :char))

;; /home/drewc/.guix-profile/include/bits/types.h:206:25
(typedef __intptr_t :long)

;; /home/drewc/.guix-profile/include/bits/types.h:209:23
(typedef __socklen_t :unsigned-int)

;; /home/drewc/.guix-profile/include/bits/types.h:214:13
(typedef __sig_atomic_t :int)

;; /home/drewc/.guix-profile/include/bits/stdint-intn.h:24:18
(typedef int8_t __int8_t)

;; /home/drewc/.guix-profile/include/bits/stdint-intn.h:25:19
(typedef int16_t __int16_t)

;; /home/drewc/.guix-profile/include/bits/stdint-intn.h:26:19
(typedef int32_t __int32_t)

;; /home/drewc/.guix-profile/include/bits/stdint-intn.h:27:19
(typedef int64_t __int64_t)

;; /home/drewc/.guix-profile/include/bits/stdint-uintn.h:24:19
(typedef uint8_t __uint8_t)

;; /home/drewc/.guix-profile/include/bits/stdint-uintn.h:25:20
(typedef uint16_t __uint16_t)

;; /home/drewc/.guix-profile/include/bits/stdint-uintn.h:26:20
(typedef uint32_t __uint32_t)

;; /home/drewc/.guix-profile/include/bits/stdint-uintn.h:27:20
(typedef uint64_t __uint64_t)

;; /home/drewc/.guix-profile/include/stdint.h:43:24
(typedef int_least8_t __int_least8_t)

;; /home/drewc/.guix-profile/include/stdint.h:44:25
(typedef int_least16_t __int_least16_t)

;; /home/drewc/.guix-profile/include/stdint.h:45:25
(typedef int_least32_t __int_least32_t)

;; /home/drewc/.guix-profile/include/stdint.h:46:25
(typedef int_least64_t __int_least64_t)

;; /home/drewc/.guix-profile/include/stdint.h:49:25
(typedef uint_least8_t __uint_least8_t)

;; /home/drewc/.guix-profile/include/stdint.h:50:26
(typedef uint_least16_t __uint_least16_t)

;; /home/drewc/.guix-profile/include/stdint.h:51:26
(typedef uint_least32_t __uint_least32_t)

;; /home/drewc/.guix-profile/include/stdint.h:52:26
(typedef uint_least64_t __uint_least64_t)

;; /home/drewc/.guix-profile/include/stdint.h:58:22
(typedef int_fast8_t :signed-char)

;; /home/drewc/.guix-profile/include/stdint.h:60:19
(typedef int_fast16_t :long)

;; /home/drewc/.guix-profile/include/stdint.h:61:19
(typedef int_fast32_t :long)

;; /home/drewc/.guix-profile/include/stdint.h:62:19
(typedef int_fast64_t :long)

;; /home/drewc/.guix-profile/include/stdint.h:71:24
(typedef uint_fast8_t :unsigned-char)

;; /home/drewc/.guix-profile/include/stdint.h:73:27
(typedef uint_fast16_t :unsigned-long)

;; /home/drewc/.guix-profile/include/stdint.h:74:27
(typedef uint_fast32_t :unsigned-long)

;; /home/drewc/.guix-profile/include/stdint.h:75:27
(typedef uint_fast64_t :unsigned-long)

;; /home/drewc/.guix-profile/include/stdint.h:87:19
(typedef intptr_t :long)

;; /home/drewc/.guix-profile/include/stdint.h:90:27
(typedef uintptr_t :unsigned-long)

;; /home/drewc/.guix-profile/include/stdint.h:101:21
(typedef intmax_t __intmax_t)

;; /home/drewc/.guix-profile/include/stdint.h:102:22
(typedef uintmax_t __uintmax_t)

;; /home/drewc/.guix-profile/include/sys/types.h:33:18
(typedef u_char __u_char)

;; /home/drewc/.guix-profile/include/sys/types.h:34:19
(typedef u_short __u_short)

;; /home/drewc/.guix-profile/include/sys/types.h:35:17
(typedef u_int __u_int)

;; /home/drewc/.guix-profile/include/sys/types.h:36:18
(typedef u_long __u_long)

;; /home/drewc/.guix-profile/include/sys/types.h:37:18
(typedef quad_t __quad_t)

;; /home/drewc/.guix-profile/include/sys/types.h:38:20
(typedef u_quad_t __u_quad_t)

;; /home/drewc/.guix-profile/include/sys/types.h:39:18
(typedef fsid_t __fsid_t)

;; /home/drewc/.guix-profile/include/sys/types.h:42:18
(typedef loff_t __loff_t)

;; /home/drewc/.guix-profile/include/sys/types.h:47:17
(typedef ino_t __ino_t)

;; /home/drewc/.guix-profile/include/sys/types.h:59:17
(typedef dev_t __dev_t)

;; /home/drewc/.guix-profile/include/sys/types.h:64:17
(typedef gid_t __gid_t)

;; /home/drewc/.guix-profile/include/sys/types.h:69:18
(typedef mode_t __mode_t)

;; /home/drewc/.guix-profile/include/sys/types.h:74:19
(typedef nlink_t __nlink_t)

;; /home/drewc/.guix-profile/include/sys/types.h:79:17
(typedef uid_t __uid_t)

;; /home/drewc/.guix-profile/include/sys/types.h:85:17
(typedef off_t __off_t)

;; /home/drewc/.guix-profile/include/sys/types.h:97:17
(typedef pid_t __pid_t)

;; /home/drewc/.guix-profile/include/sys/types.h:103:16
(typedef id_t __id_t)

;; /home/drewc/.guix-profile/include/sys/types.h:108:19
(typedef ssize_t __ssize_t)

;; /home/drewc/.guix-profile/include/sys/types.h:114:19
(typedef daddr_t __daddr_t)

;; /home/drewc/.guix-profile/include/sys/types.h:115:19
(typedef caddr_t __caddr_t)

;; /home/drewc/.guix-profile/include/sys/types.h:121:17
(typedef key_t __key_t)

;; /home/drewc/.guix-profile/include/bits/types/clock_t.h:7:19
(typedef clock_t __clock_t)

;; /home/drewc/.guix-profile/include/bits/types/clockid_t.h:7:21
(typedef clockid_t __clockid_t)

;; /home/drewc/.guix-profile/include/bits/types/time_t.h:7:18
(typedef time_t __time_t)

;; /home/drewc/.guix-profile/include/bits/types/timer_t.h:7:19
(typedef timer_t __timer_t)

;; /gnu/store/sx7csjb8s1paga5icbmrhxy0rq2a8gqk-clang-11.0.0/lib/clang/11.0.0/include/stddef.h:46:23
(typedef size_t :unsigned-long)

;; /home/drewc/.guix-profile/include/sys/types.h:148:27
(typedef ulong :unsigned-long)

;; /home/drewc/.guix-profile/include/sys/types.h:149:28
(typedef ushort :unsigned-short)

;; /home/drewc/.guix-profile/include/sys/types.h:150:22
(typedef uint :unsigned-int)

;; /home/drewc/.guix-profile/include/sys/types.h:158:19
(typedef u_int8_t __uint8_t)

;; /home/drewc/.guix-profile/include/sys/types.h:159:20
(typedef u_int16_t __uint16_t)

;; /home/drewc/.guix-profile/include/sys/types.h:160:20
(typedef u_int32_t __uint32_t)

;; /home/drewc/.guix-profile/include/sys/types.h:161:20
(typedef u_int64_t __uint64_t)

;; /home/drewc/.guix-profile/include/sys/types.h:166:13
(typedef register_t :int)

;; /home/drewc/.guix-profile/include/bits/byteswap.h:34:1
(function "__bswap_16" ((__bsx __uint16_t)) __uint16_t)

;; /home/drewc/.guix-profile/include/bits/byteswap.h:49:1
(function "__bswap_32" ((__bsx __uint32_t)) __uint32_t)

;; /home/drewc/.guix-profile/include/bits/byteswap.h:70:1
(function "__bswap_64" ((__bsx __uint64_t)) __uint64_t)

;; /home/drewc/.guix-profile/include/bits/uintn-identity.h:33:1
(function "__uint16_identity" ((__x __uint16_t)) __uint16_t)

;; /home/drewc/.guix-profile/include/bits/uintn-identity.h:39:1
(function "__uint32_identity" ((__x __uint32_t)) __uint32_t)

;; /home/drewc/.guix-profile/include/bits/uintn-identity.h:45:1
(function "__uint64_identity" ((__x __uint64_t)) __uint64_t)

;; /home/drewc/.guix-profile/include/bits/types/__sigset_t.h:8:3
(typedef __sigset_t ;; /home/drewc/.guix-profile/include/bits/types/__sigset_t.h:5:9
(struct :id 4
    (__val (:array :unsigned-long 16))))

;; /home/drewc/.guix-profile/include/bits/types/sigset_t.h:7:20
(typedef sigset_t __sigset_t)

;; /home/drewc/.guix-profile/include/bits/types/struct_timeval.h:8:8
(struct timeval
  (tv_sec __time_t)
  (tv_usec __suseconds_t))

;; /home/drewc/.guix-profile/include/bits/types/struct_timespec.h:10:8
(struct timespec
  (tv_sec __time_t)
  (tv_nsec __syscall_slong_t))

;; /home/drewc/.guix-profile/include/sys/select.h:43:23
(typedef suseconds_t __suseconds_t)

;; /home/drewc/.guix-profile/include/sys/select.h:49:18
(typedef __fd_mask :long)

;; /home/drewc/.guix-profile/include/sys/select.h:70:5
(typedef fd_set ;; /home/drewc/.guix-profile/include/sys/select.h:59:9
(struct :id 5
    (__fds_bits (:array __fd_mask 16))))

;; /home/drewc/.guix-profile/include/sys/select.h:77:19
(typedef fd_mask __fd_mask)

;; /home/drewc/.guix-profile/include/sys/select.h:101:12
(function "select" ((__nfds :int) (__readfds (:pointer fd_set)) (__writefds (:pointer fd_set)) (__exceptfds (:pointer fd_set)) (__timeout (:pointer (:struct timeval)))) :int)

;; /home/drewc/.guix-profile/include/sys/select.h:113:12
(function "pselect" ((__nfds :int) (__readfds (:pointer fd_set)) (__writefds (:pointer fd_set)) (__exceptfds (:pointer fd_set)) (__timeout (:pointer (:struct timespec))) (__sigmask (:pointer __sigset_t))) :int)

;; /home/drewc/.guix-profile/include/sys/types.h:185:21
(typedef blksize_t __blksize_t)

;; /home/drewc/.guix-profile/include/sys/types.h:192:20
(typedef blkcnt_t __blkcnt_t)

;; /home/drewc/.guix-profile/include/sys/types.h:196:22
(typedef fsblkcnt_t __fsblkcnt_t)

;; /home/drewc/.guix-profile/include/sys/types.h:200:22
(typedef fsfilcnt_t __fsfilcnt_t)

;; /home/drewc/.guix-profile/include/bits/thread-shared-types.h:49:16
(struct __pthread_internal_list
  (__prev (:pointer (:struct __pthread_internal_list)))
  (__next (:pointer (:struct __pthread_internal_list))))

;; /home/drewc/.guix-profile/include/bits/thread-shared-types.h:53:3
(typedef __pthread_list_t (:struct __pthread_internal_list))

;; /home/drewc/.guix-profile/include/bits/thread-shared-types.h:55:16
(struct __pthread_internal_slist
  (__next (:pointer (:struct __pthread_internal_slist))))

;; /home/drewc/.guix-profile/include/bits/thread-shared-types.h:58:3
(typedef __pthread_slist_t (:struct __pthread_internal_slist))

;; /home/drewc/.guix-profile/include/bits/struct_mutex.h:22:8
(struct __pthread_mutex_s
  (__lock :int)
  (__count :unsigned-int)
  (__owner :int)
  (__nusers :unsigned-int)
  (__kind :int)
  (__spins :short)
  (__elision :short)
  (__list __pthread_list_t))

;; /home/drewc/.guix-profile/include/bits/struct_rwlock.h:23:8
(struct __pthread_rwlock_arch_t
  (__readers :unsigned-int)
  (__writers :unsigned-int)
  (__wrphase_futex :unsigned-int)
  (__writers_futex :unsigned-int)
  (__pad3 :unsigned-int)
  (__pad4 :unsigned-int)
  (__cur_writer :int)
  (__shared :int)
  (__rwelision :signed-char)
  (__pad1 (:array :unsigned-char 7))
  (__pad2 :unsigned-long)
  (__flags :unsigned-int))

;; /home/drewc/.guix-profile/include/bits/thread-shared-types.h:92:8
(struct __pthread_cond_s
  ( ;; /home/drewc/.guix-profile/include/bits/thread-shared-types.h:94:17
(union :id 10
    (__wseq :unsigned-long-long)
    (__wseq32 ;; /home/drewc/.guix-profile/include/bits/thread-shared-types.h:97:5
(struct :id 11
      (__low :unsigned-int)
      (__high :unsigned-int)))))
  ( ;; /home/drewc/.guix-profile/include/bits/thread-shared-types.h:103:17
(union :id 12
    (__g1_start :unsigned-long-long)
    (__g1_start32 ;; /home/drewc/.guix-profile/include/bits/thread-shared-types.h:106:5
(struct :id 13
      (__low :unsigned-int)
      (__high :unsigned-int)))))
  (__g_refs (:array :unsigned-int 2))
  (__g_size (:array :unsigned-int 2))
  (__g1_orig_size :unsigned-int)
  (__wrefs :unsigned-int)
  (__g_signals (:array :unsigned-int 2)))

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:27:27
(typedef pthread_t :unsigned-long)

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:36:3
(typedef pthread_mutexattr_t ;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:32:9
(union :id 14
    (__size (:array :char 4))
    (__align :int)))

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:45:3
(typedef pthread_condattr_t ;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:41:9
(union :id 15
    (__size (:array :char 4))
    (__align :int)))

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:49:22
(typedef pthread_key_t :unsigned-int)

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:53:30
(typedef pthread_once_t :int)

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:56:7
(union pthread_attr_t
  (__size (:array :char 56))
  (__align :long))

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:62:30
(typedef pthread_attr_t (:union pthread_attr_t))

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:72:3
(typedef pthread_mutex_t ;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:67:9
(union :id 17
    (__data (:struct __pthread_mutex_s))
    (__size (:array :char 40))
    (__align :long)))

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:80:3
(typedef pthread_cond_t ;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:75:9
(union :id 19
    (__data (:struct __pthread_cond_s))
    (__size (:array :char 48))
    (__align :long-long)))

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:91:3
(typedef pthread_rwlock_t ;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:86:9
(union :id 21
    (__data (:struct __pthread_rwlock_arch_t))
    (__size (:array :char 56))
    (__align :long)))

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:97:3
(typedef pthread_rwlockattr_t ;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:93:9
(union :id 23
    (__size (:array :char 8))
    (__align :long)))

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:103:22
(typedef pthread_spinlock_t :int)

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:112:3
(typedef pthread_barrier_t ;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:108:9
(union :id 24
    (__size (:array :char 32))
    (__align :long)))

;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:118:3
(typedef pthread_barrierattr_t ;; /home/drewc/.guix-profile/include/bits/pthreadtypes.h:114:9
(union :id 25
    (__size (:array :char 4))
    (__align :int)))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:44:8
(struct fuse_file_info
  (flags :int)
  (writepage (:bitfield 1 :unsigned-int))
  (direct_io (:bitfield 1 :unsigned-int))
  (keep_cache (:bitfield 1 :unsigned-int))
  (flush (:bitfield 1 :unsigned-int))
  (nonseekable (:bitfield 1 :unsigned-int))
  (flock_release (:bitfield 1 :unsigned-int))
  (cache_readdir (:bitfield 1 :unsigned-int))
  (padding (:bitfield 25 :unsigned-int))
  (padding2 (:bitfield 32 :unsigned-int))
  (fh uint64_t)
  (lock_owner uint64_t)
  (poll_events uint32_t))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:107:8
(struct fuse_loop_config
  (clone_fd :int)
  (max_idle_threads :unsigned-int))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:421:8
(struct fuse_conn_info
  (proto_major :unsigned-int)
  (proto_minor :unsigned-int)
  (max_write :unsigned-int)
  (max_read :unsigned-int)
  (max_readahead :unsigned-int)
  (capable :unsigned-int)
  (want :unsigned-int)
  (max_background :unsigned-int)
  (congestion_threshold :unsigned-int)
  (time_gran :unsigned-int)
  (reserved (:array :unsigned-int 22)))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:532:8
(struct fuse_session
  )

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:533:8
(struct fuse_pollhandle
  )

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:534:8
(struct fuse_conn_info_opts
  )

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:578:29
(function "fuse_parse_conn_info_opts" ((args (:pointer (:struct fuse_args)))) (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:534:8
(struct fuse_conn_info_opts
      )))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:587:6
(function "fuse_apply_conn_info_opts" ((opts (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:534:8
(struct fuse_conn_info_opts
      ))) (conn (:pointer (:struct fuse_conn_info)))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:596:5
(function "fuse_daemonize" ((foreground :int)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:603:5
(function "fuse_version" () :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:610:13
(function "fuse_pkgversion" () (:pointer :char))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:617:6
(function "fuse_pollhandle_destroy" ((ph (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:533:8
(struct fuse_pollhandle
      )))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:626:6
(enum fuse_buf_flags
    (FUSE_BUF_IS_FD 2)
    (FUSE_BUF_FD_SEEK 4)
    (FUSE_BUF_FD_RETRY 8))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:657:6
(enum fuse_buf_copy_flags
    (FUSE_BUF_NO_SPLICE 2)
    (FUSE_BUF_FORCE_SPLICE 4)
    (FUSE_BUF_SPLICE_MOVE 8)
    (FUSE_BUF_SPLICE_NONBLOCK 16))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:702:8
(struct fuse_buf
  (size size_t)
  (flags (:enum fuse_buf_flags))
  (mem (:pointer :void))
  (fd :int)
  (pos off_t))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:743:8
(struct fuse_bufvec
  (count size_t)
  (idx size_t)
  (off size_t)
  (buf (:array (:struct fuse_buf) 1)))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:786:8
(function "fuse_buf_size" ((bufv (:pointer (:struct fuse_bufvec)))) size_t)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:796:9
(function "fuse_buf_copy" ((dst (:pointer (:struct fuse_bufvec))) (src (:pointer (:struct fuse_bufvec))) (flags (:enum fuse_buf_copy_flags))) ssize_t)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:818:5
(function "fuse_set_signal_handlers" ((se (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:532:8
(struct fuse_session
      )))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:831:6
(function "fuse_remove_signal_handlers" ((se (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:532:8
(struct fuse_session
      )))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:855:8
(struct _fuse_off_t_must_be_64bit_dummy_struct
  (_fuse_off_t_must_be_64bit (:bitfield 1 :unsigned-int)))

;; /home/drewc/.guix-profile/include/bits/fcntl.h:35:8
(struct flock
  (l_type :short)
  (l_whence :short)
  (l_start __off_t)
  (l_len __off_t)
  (l_pid __pid_t))

;; /home/drewc/.guix-profile/include/bits/stat.h:46:8
(struct stat
  (st_dev __dev_t)
  (st_ino __ino_t)
  (st_nlink __nlink_t)
  (st_mode __mode_t)
  (st_uid __uid_t)
  (st_gid __gid_t)
  (__pad0 :int)
  (st_rdev __dev_t)
  (st_size __off_t)
  (st_blksize __blksize_t)
  (st_blocks __blkcnt_t)
  (st_atim (:struct timespec))
  (st_mtim (:struct timespec))
  (st_ctim (:struct timespec))
  (__glibc_reserved (:array __syscall_slong_t 3)))

;; /home/drewc/.guix-profile/include/fcntl.h:176:12
(function "fcntl" ((__fd :int) (__cmd :int)) :int :variadic)

;; /home/drewc/.guix-profile/include/fcntl.h:196:12
(function "open" ((__file (:pointer :char)) (__oflag :int)) :int :variadic)

;; /home/drewc/.guix-profile/include/fcntl.h:220:12
(function "openat" ((__fd :int) (__file (:pointer :char)) (__oflag :int)) :int :variadic)

;; /home/drewc/.guix-profile/include/fcntl.h:242:12
(function "creat" ((__file (:pointer :char)) (__mode mode_t)) :int)

;; /home/drewc/.guix-profile/include/fcntl.h:271:12
(function "lockf" ((__fd :int) (__cmd :int) (__len off_t)) :int)

;; /home/drewc/.guix-profile/include/fcntl.h:288:12
(function "posix_fadvise" ((__fd :int) (__offset off_t) (__len off_t) (__advise :int)) :int)

;; /home/drewc/.guix-profile/include/fcntl.h:310:12
(function "posix_fallocate" ((__fd :int) (__offset off_t) (__len off_t)) :int)

;; /home/drewc/.guix-profile/include/bits/types/struct_tm.h:7:8
(struct tm
  (tm_sec :int)
  (tm_min :int)
  (tm_hour :int)
  (tm_mday :int)
  (tm_mon :int)
  (tm_year :int)
  (tm_wday :int)
  (tm_yday :int)
  (tm_isdst :int)
  (tm_gmtoff :long)
  (tm_zone (:pointer :char)))

;; /home/drewc/.guix-profile/include/bits/types/struct_itimerspec.h:8:8
(struct itimerspec
  (it_interval (:struct timespec))
  (it_value (:struct timespec)))

;; /home/drewc/.guix-profile/include/time.h:49:8
(struct sigevent
  )

;; /home/drewc/.guix-profile/include/bits/types/__locale_t.h:28:8
(struct __locale_struct
  (__locales (:array (:pointer ;; /home/drewc/.guix-profile/include/bits/types/__locale_t.h:31:10
(struct __locale_data
        )) 13))
  (__ctype_b (:pointer :unsigned-short))
  (__ctype_tolower (:pointer :int))
  (__ctype_toupper (:pointer :int))
  (__names (:array (:pointer :char) 13)))

;; /home/drewc/.guix-profile/include/bits/types/__locale_t.h:31:10
(struct __locale_data
  )

;; /home/drewc/.guix-profile/include/bits/types/__locale_t.h:42:33
(typedef __locale_t (:pointer (:struct __locale_struct)))

;; /home/drewc/.guix-profile/include/bits/types/locale_t.h:24:20
(typedef locale_t __locale_t)

;; /home/drewc/.guix-profile/include/time.h:72:16
(function "clock" () clock_t)

;; /home/drewc/.guix-profile/include/time.h:75:15
(function "time" ((__timer (:pointer time_t))) time_t)

;; /home/drewc/.guix-profile/include/time.h:78:15
(function "difftime" ((__time1 time_t) (__time0 time_t)) :double)

;; /home/drewc/.guix-profile/include/time.h:82:15
(function "mktime" ((__tp (:pointer (:struct tm)))) time_t)

;; /home/drewc/.guix-profile/include/time.h:88:15
(function "strftime" ((__s (:pointer :char)) (__maxsize size_t) (__format (:pointer :char)) (__tp (:pointer (:struct tm)))) size_t)

;; /home/drewc/.guix-profile/include/time.h:104:15
(function "strftime_l" ((__s (:pointer :char)) (__maxsize size_t) (__format (:pointer :char)) (__tp (:pointer (:struct tm))) (__loc locale_t)) size_t)

;; /home/drewc/.guix-profile/include/time.h:119:19
(function "gmtime" ((__timer (:pointer time_t))) (:pointer (:struct tm)))

;; /home/drewc/.guix-profile/include/time.h:123:19
(function "localtime" ((__timer (:pointer time_t))) (:pointer (:struct tm)))

;; /home/drewc/.guix-profile/include/time.h:128:19
(function "gmtime_r" ((__timer (:pointer time_t)) (__tp (:pointer (:struct tm)))) (:pointer (:struct tm)))

;; /home/drewc/.guix-profile/include/time.h:133:19
(function "localtime_r" ((__timer (:pointer time_t)) (__tp (:pointer (:struct tm)))) (:pointer (:struct tm)))

;; /home/drewc/.guix-profile/include/time.h:139:14
(function "asctime" ((__tp (:pointer (:struct tm)))) (:pointer :char))

;; /home/drewc/.guix-profile/include/time.h:142:14
(function "ctime" ((__timer (:pointer time_t))) (:pointer :char))

;; /home/drewc/.guix-profile/include/time.h:149:14
(function "asctime_r" ((__tp (:pointer (:struct tm))) (__buf (:pointer :char))) (:pointer :char))

;; /home/drewc/.guix-profile/include/time.h:153:14
(function "ctime_r" ((__timer (:pointer time_t)) (__buf (:pointer :char))) (:pointer :char))

;; /home/drewc/.guix-profile/include/time.h:159:14
(extern __tzname (:array (:pointer :char) 2))

;; /home/drewc/.guix-profile/include/time.h:160:12
(extern __daylight :int)

;; /home/drewc/.guix-profile/include/time.h:161:17
(extern __timezone :long)

;; /home/drewc/.guix-profile/include/time.h:166:14
(extern tzname (:array (:pointer :char) 2))

;; /home/drewc/.guix-profile/include/time.h:170:13
(function "tzset" () :void)

;; /home/drewc/.guix-profile/include/time.h:174:12
(extern daylight :int)

;; /home/drewc/.guix-profile/include/time.h:175:17
(extern timezone :long)

;; /home/drewc/.guix-profile/include/time.h:190:15
(function "timegm" ((__tp (:pointer (:struct tm)))) time_t)

;; /home/drewc/.guix-profile/include/time.h:193:15
(function "timelocal" ((__tp (:pointer (:struct tm)))) time_t)

;; /home/drewc/.guix-profile/include/time.h:196:12
(function "dysize" ((__year :int)) :int)

;; /home/drewc/.guix-profile/include/time.h:205:12
(function "nanosleep" ((__requested_time (:pointer (:struct timespec))) (__remaining (:pointer (:struct timespec)))) :int)

;; /home/drewc/.guix-profile/include/time.h:210:12
(function "clock_getres" ((__clock_id clockid_t) (__res (:pointer (:struct timespec)))) :int)

;; /home/drewc/.guix-profile/include/time.h:213:12
(function "clock_gettime" ((__clock_id clockid_t) (__tp (:pointer (:struct timespec)))) :int)

;; /home/drewc/.guix-profile/include/time.h:216:12
(function "clock_settime" ((__clock_id clockid_t) (__tp (:pointer (:struct timespec)))) :int)

;; /home/drewc/.guix-profile/include/time.h:224:12
(function "clock_nanosleep" ((__clock_id clockid_t) (__flags :int) (__req (:pointer (:struct timespec))) (__rem (:pointer (:struct timespec)))) :int)

;; /home/drewc/.guix-profile/include/time.h:229:12
(function "clock_getcpuclockid" ((__pid pid_t) (__clock_id (:pointer clockid_t))) :int)

;; /home/drewc/.guix-profile/include/time.h:234:12
(function "timer_create" ((__clock_id clockid_t) (__evp (:pointer ;; /home/drewc/.guix-profile/include/time.h:49:8
(struct sigevent
      ))) (__timerid (:pointer timer_t))) :int)

;; /home/drewc/.guix-profile/include/time.h:239:12
(function "timer_delete" ((__timerid timer_t)) :int)

;; /home/drewc/.guix-profile/include/time.h:242:12
(function "timer_settime" ((__timerid timer_t) (__flags :int) (__value (:pointer (:struct itimerspec))) (__ovalue (:pointer (:struct itimerspec)))) :int)

;; /home/drewc/.guix-profile/include/time.h:247:12
(function "timer_gettime" ((__timerid timer_t) (__value (:pointer (:struct itimerspec)))) :int)

;; /home/drewc/.guix-profile/include/time.h:251:12
(function "timer_getoverrun" ((__timerid timer_t)) :int)

;; /home/drewc/.guix-profile/include/time.h:257:12
(function "timespec_get" ((__ts (:pointer (:struct timespec))) (__base :int)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:205:12
(function "stat" ((__file (:pointer :char)) (__buf (:pointer (:struct stat)))) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:210:12
(function "fstat" ((__fd :int) (__buf (:pointer (:struct stat)))) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:234:12
(function "fstatat" ((__fd :int) (__file (:pointer :char)) (__buf (:pointer (:struct stat))) (__flag :int)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:259:12
(function "lstat" ((__file (:pointer :char)) (__buf (:pointer (:struct stat)))) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:280:12
(function "chmod" ((__file (:pointer :char)) (__mode __mode_t)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:287:12
(function "lchmod" ((__file (:pointer :char)) (__mode __mode_t)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:293:12
(function "fchmod" ((__fd :int) (__mode __mode_t)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:299:12
(function "fchmodat" ((__fd :int) (__file (:pointer :char)) (__mode __mode_t) (__flag :int)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:308:17
(function "umask" ((__mask __mode_t)) __mode_t)

;; /home/drewc/.guix-profile/include/sys/stat.h:317:12
(function "mkdir" ((__path (:pointer :char)) (__mode __mode_t)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:324:12
(function "mkdirat" ((__fd :int) (__path (:pointer :char)) (__mode __mode_t)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:332:12
(function "mknod" ((__path (:pointer :char)) (__mode __mode_t) (__dev __dev_t)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:339:12
(function "mknodat" ((__fd :int) (__path (:pointer :char)) (__mode __mode_t) (__dev __dev_t)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:346:12
(function "mkfifo" ((__path (:pointer :char)) (__mode __mode_t)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:353:12
(function "mkfifoat" ((__fd :int) (__path (:pointer :char)) (__mode __mode_t)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:360:12
(function "utimensat" ((__fd :int) (__path (:pointer :char)) (__times (:array (:struct timespec) 2)) (__flags :int)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:368:12
(function "futimens" ((__fd :int) (__times (:array (:struct timespec) 2))) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:395:12
(function "__fxstat" ((__ver :int) (__fildes :int) (__stat_buf (:pointer (:struct stat)))) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:397:12
(function "__xstat" ((__ver :int) (__filename (:pointer :char)) (__stat_buf (:pointer (:struct stat)))) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:399:12
(function "__lxstat" ((__ver :int) (__filename (:pointer :char)) (__stat_buf (:pointer (:struct stat)))) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:401:12
(function "__fxstatat" ((__ver :int) (__fildes :int) (__filename (:pointer :char)) (__stat_buf (:pointer (:struct stat))) (__flag :int)) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:438:12
(function "__xmknod" ((__ver :int) (__path (:pointer :char)) (__mode __mode_t) (__dev (:pointer __dev_t))) :int)

;; /home/drewc/.guix-profile/include/sys/stat.h:441:12
(function "__xmknodat" ((__ver :int) (__fd :int) (__path (:pointer :char)) (__mode __mode_t) (__dev (:pointer __dev_t))) :int)

;; /home/drewc/.guix-profile/include/bits/statvfs.h:29:8
(struct statvfs
  (f_bsize :unsigned-long)
  (f_frsize :unsigned-long)
  (f_blocks __fsblkcnt_t)
  (f_bfree __fsblkcnt_t)
  (f_bavail __fsblkcnt_t)
  (f_files __fsfilcnt_t)
  (f_ffree __fsfilcnt_t)
  (f_favail __fsfilcnt_t)
  (f_fsid :unsigned-long)
  (f_flag :unsigned-long)
  (f_namemax :unsigned-long)
  (__f_spare (:array :int 6)))

;; /home/drewc/.guix-profile/include/bits/statvfs.h:80:1
(enum :id 38
    (ST_RDONLY 1)
    (ST_NOSUID 2))

;; /home/drewc/.guix-profile/include/sys/statvfs.h:51:12
(function "statvfs" ((__file (:pointer :char)) (__buf (:pointer (:struct statvfs)))) :int)

;; /home/drewc/.guix-profile/include/sys/statvfs.h:73:12
(function "fstatvfs" ((__fildes :int) (__buf (:pointer (:struct statvfs)))) :int)

;; /home/drewc/.guix-profile/include/bits/types/struct_iovec.h:26:8
(struct iovec
  (iov_base (:pointer :void))
  (iov_len size_t))

;; /home/drewc/.guix-profile/include/sys/uio.h:41:16
(function "readv" ((__fd :int) (__iovec (:pointer (:struct iovec))) (__count :int)) ssize_t)

;; /home/drewc/.guix-profile/include/sys/uio.h:52:16
(function "writev" ((__fd :int) (__iovec (:pointer (:struct iovec))) (__count :int)) ssize_t)

;; /home/drewc/.guix-profile/include/sys/uio.h:67:16
(function "preadv" ((__fd :int) (__iovec (:pointer (:struct iovec))) (__count :int) (__offset __off_t)) ssize_t)

;; /home/drewc/.guix-profile/include/sys/uio.h:79:16
(function "pwritev" ((__fd :int) (__iovec (:pointer (:struct iovec))) (__count :int) (__offset __off_t)) ssize_t)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
  )

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:42:6
(enum fuse_readdir_flags
    (FUSE_READDIR_PLUS 1))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:57:6
(enum fuse_fill_dir_flags
    (FUSE_FILL_DIR_PLUS 2))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:85:15
(typedef fuse_fill_dir_t :function-pointer)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:96:8
(struct fuse_config
  (set_gid :int)
  (gid :unsigned-int)
  (set_uid :int)
  (uid :unsigned-int)
  (set_mode :int)
  (umask :unsigned-int)
  (entry_timeout :double)
  (negative_timeout :double)
  (attr_timeout :double)
  (intr :int)
  (intr_signal :int)
  (remember :int)
  (hard_remove :int)
  (use_ino :int)
  (readdir_ino :int)
  (direct_io :int)
  (kernel_cache :int)
  (auto_cache :int)
  (ac_attr_timeout_set :int)
  (ac_attr_timeout :double)
  (nullpath_ok :int)
  (show_help :int)
  (modules (:pointer :char))
  (debug :int))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:302:8
(struct fuse_operations
  (getattr :function-pointer)
  (readlink :function-pointer)
  (mknod :function-pointer)
  (mkdir :function-pointer)
  (unlink :function-pointer)
  (rmdir :function-pointer)
  (symlink :function-pointer)
  (rename :function-pointer)
  (link :function-pointer)
  (chmod :function-pointer)
  (chown :function-pointer)
  (truncate :function-pointer)
  (open :function-pointer)
  (read :function-pointer)
  (write :function-pointer)
  (statfs :function-pointer)
  (flush :function-pointer)
  (release :function-pointer)
  (fsync :function-pointer)
  (setxattr :function-pointer)
  (getxattr :function-pointer)
  (listxattr :function-pointer)
  (removexattr :function-pointer)
  (opendir :function-pointer)
  (readdir :function-pointer)
  (releasedir :function-pointer)
  (fsyncdir :function-pointer)
  (init :function-pointer)
  (destroy :function-pointer)
  (access :function-pointer)
  (create :function-pointer)
  (lock :function-pointer)
  (utimens :function-pointer)
  (bmap :function-pointer)
  (ioctl :function-pointer)
  (poll :function-pointer)
  (write_buf :function-pointer)
  (read_buf :function-pointer)
  (flock :function-pointer)
  (fallocate :function-pointer)
  (copy_file_range :function-pointer)
  (lseek :function-pointer))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:800:8
(struct fuse_context
  (fuse (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      )))
  (uid uid_t)
  (gid gid_t)
  (pid pid_t)
  (private_data (:pointer :void))
  (umask mode_t))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:896:6
(function "fuse_lib_help" ((args (:pointer (:struct fuse_args)))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:930:14
(function "fuse_new" ((args (:pointer (:struct fuse_args))) (op (:pointer (:struct fuse_operations))) (op_size size_t) (private_data (:pointer :void))) (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      )))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:942:5
(function "fuse_mount" ((f (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      ))) (mountpoint (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:951:6
(function "fuse_unmount" ((f (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      )))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:961:6
(function "fuse_destroy" ((f (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      )))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:978:5
(function "fuse_loop" ((f (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      )))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:988:6
(function "fuse_exit" ((f (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      )))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:991:5
(function "fuse_loop_mt_31" ((f (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      ))) (clone_fd :int)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1036:22
(function "fuse_get_context" () (:pointer (:struct fuse_context)))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1056:5
(function "fuse_getgroups" ((size :int) (list (:pointer gid_t))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1063:5
(function "fuse_interrupted" () :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1076:5
(function "fuse_invalidate_path" ((f (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      ))) (path (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1083:5
(function "fuse_main_real" ((argc :int) (argv (:pointer (:pointer :char))) (op (:pointer (:struct fuse_operations))) (op_size size_t) (private_data (:pointer :void))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1093:5
(function "fuse_start_cleanup_thread" ((fuse (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      )))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1101:6
(function "fuse_stop_cleanup_thread" ((fuse (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      )))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1112:5
(function "fuse_clean_cache" ((fuse (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      )))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
  )

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1134:5
(function "fuse_fs_getattr" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (buf (:pointer (:struct stat))) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1136:5
(function "fuse_fs_rename" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (oldpath (:pointer :char)) (newpath (:pointer :char)) (flags :unsigned-int)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1138:5
(function "fuse_fs_unlink" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1139:5
(function "fuse_fs_rmdir" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1140:5
(function "fuse_fs_symlink" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (linkname (:pointer :char)) (path (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1142:5
(function "fuse_fs_link" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (oldpath (:pointer :char)) (newpath (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1143:5
(function "fuse_fs_release" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1145:5
(function "fuse_fs_open" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1147:5
(function "fuse_fs_read" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (buf (:pointer :char)) (size size_t) (off off_t) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1149:5
(function "fuse_fs_read_buf" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (bufp (:pointer (:pointer (:struct fuse_bufvec)))) (size size_t) (off off_t) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1152:5
(function "fuse_fs_write" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (buf (:pointer :char)) (size size_t) (off off_t) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1154:5
(function "fuse_fs_write_buf" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (buf (:pointer (:struct fuse_bufvec))) (off off_t) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1157:5
(function "fuse_fs_fsync" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (datasync :int) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1159:5
(function "fuse_fs_flush" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1161:5
(function "fuse_fs_statfs" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (buf (:pointer (:struct statvfs)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1162:5
(function "fuse_fs_opendir" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1164:5
(function "fuse_fs_readdir" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (buf (:pointer :void)) (filler fuse_fill_dir_t) (off off_t) (fi (:pointer (:struct fuse_file_info))) (flags (:enum fuse_readdir_flags))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1167:5
(function "fuse_fs_fsyncdir" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (datasync :int) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1169:5
(function "fuse_fs_releasedir" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1171:5
(function "fuse_fs_create" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (mode mode_t) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1173:5
(function "fuse_fs_lock" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (fi (:pointer (:struct fuse_file_info))) (cmd :int) (lock (:pointer (:struct flock)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1175:5
(function "fuse_fs_flock" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (fi (:pointer (:struct fuse_file_info))) (op :int)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1177:5
(function "fuse_fs_chmod" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (mode mode_t) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1179:5
(function "fuse_fs_chown" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (uid uid_t) (gid gid_t) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1181:5
(function "fuse_fs_truncate" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (size off_t) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1183:5
(function "fuse_fs_utimens" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (tv (:array (:struct timespec) 2)) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1185:5
(function "fuse_fs_access" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (mask :int)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1186:5
(function "fuse_fs_readlink" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (buf (:pointer :char)) (len size_t)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1188:5
(function "fuse_fs_mknod" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (mode mode_t) (rdev dev_t)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1190:5
(function "fuse_fs_mkdir" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (mode mode_t)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1191:5
(function "fuse_fs_setxattr" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (name (:pointer :char)) (value (:pointer :char)) (size size_t) (flags :int)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1193:5
(function "fuse_fs_getxattr" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (name (:pointer :char)) (value (:pointer :char)) (size size_t)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1195:5
(function "fuse_fs_listxattr" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (list (:pointer :char)) (size size_t)) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1197:5
(function "fuse_fs_removexattr" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (name (:pointer :char))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1199:5
(function "fuse_fs_bmap" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (blocksize size_t) (idx (:pointer uint64_t))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1202:5
(function "fuse_fs_ioctl" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (cmd :int) (arg (:pointer :void)) (fi (:pointer (:struct fuse_file_info))) (flags :unsigned-int) (data (:pointer :void))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1210:5
(function "fuse_fs_poll" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (fi (:pointer (:struct fuse_file_info))) (ph (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:533:8
(struct fuse_pollhandle
      ))) (reventsp (:pointer :unsigned-int))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1213:5
(function "fuse_fs_fallocate" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (mode :int) (offset off_t) (length off_t) (fi (:pointer (:struct fuse_file_info)))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1215:9
(function "fuse_fs_copy_file_range" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path_in (:pointer :char)) (fi_in (:pointer (:struct fuse_file_info))) (off_in off_t) (path_out (:pointer :char)) (fi_out (:pointer (:struct fuse_file_info))) (off_out off_t) (len size_t) (flags :int)) ssize_t)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1220:7
(function "fuse_fs_lseek" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (path (:pointer :char)) (off off_t) (whence :int) (fi (:pointer (:struct fuse_file_info)))) off_t)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1222:6
(function "fuse_fs_init" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      ))) (conn (:pointer (:struct fuse_conn_info))) (cfg (:pointer (:struct fuse_config)))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1224:6
(function "fuse_fs_destroy" ((fs (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      )))) :void)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1226:5
(function "fuse_notify_poll" ((ph (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:533:8
(struct fuse_pollhandle
      )))) :int)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1241:17
(function "fuse_fs_new" ((op (:pointer (:struct fuse_operations))) (op_size size_t) (private_data (:pointer :void))) (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1123:8
(struct fuse_fs
      )))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1258:27
(typedef fuse_module_factory_t :function-pointer)

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1274:22
(function "fuse_get_session" ((f (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:37:8
(struct fuse
      )))) (:pointer ;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse_common.h:532:8
(struct fuse_session
      )))

;; /gnu/store/4mx57hjn2f12m27ik0plh4r0wgq434py-fuse-3.10.5/include/fuse3/fuse.h:1284:5
(function "fuse_open_channel" ((mountpoint (:pointer :char)) (options (:pointer :char))) :int)
))
