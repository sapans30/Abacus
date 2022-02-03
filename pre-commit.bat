REM  PRE-COMMIT HOOK
REM 
REM  The pre-commit hook is invoked before a Subversion txn is
REM  committed.  Subversion runs this hook by invoking a program
REM  (script, executable, binary, etc.) named 'pre-commit' (for which
REM  this file is a template), with the following ordered arguments:
REM 
REM    [1] REPOS-PATH   (the path to this repository)
REM    [2] TXN-NAME     (the name of the txn about to be committed)
REM 
REM  The default working directory for the invocation is undefined, so
REM  the program should set one explicitly if it cares.
REM 
REM  If the hook program exits with success, the txn is committed; but
REM  if it exits with failure (non-zero), the txn is aborted, no commit
REM  takes place, and STDERR is returned to the client.   The hook
REM  program can use the 'svnlook' utility to help it examine the txn.
REM 
REM  The hook program typically does not inherit the environment of
REM  its parent process.  For example, a common problem is for the
REM  PATH environment variable to not be set to its usual value, so
REM  that subprograms fail to launch unless invoked via absolute path.
REM  If you're having unexpected problems with a hook program, the
REM  culprit may be unusual (or missing) environment variables.

set local
set REPOS=%1
set TXN=%2

REM set ALDONDIR to the install location of LM(e) Daily. For example:
set ALDONDIR="C:\Program Files (x86)\Aldon\Aldon LM 6.7"

REM set SVNBIN to the bin directory of the SVN server. For example:
set SVNBIN="C:\SVN Server\bin"

rem  echo "REPOS= %REPOS%" 1>&2
rem  echo "ALDONDIR = %ALDONDIR%" 1>&2
REM  Check that the author of this commit has the rights to perform
REM  the commit on the files and directories being modified.
%ALDONDIR%\aldonsvn.exe --precommit %REPOS% %TXN% %SVNBIN%
if %errorlevel% gtr 0 exit 1

REM  All checks passed, so allow the commit.
exit 0
