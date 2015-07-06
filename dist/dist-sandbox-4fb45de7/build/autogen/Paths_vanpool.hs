module Paths_vanpool (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/gpeterson/code/haskell/scotty-first/.cabal-sandbox/bin"
libdir     = "/Users/gpeterson/code/haskell/scotty-first/.cabal-sandbox/lib/x86_64-osx-ghc-7.10.1/vanpo_5V7HP9PtvzbLPvi5IaoHdu"
datadir    = "/Users/gpeterson/code/haskell/scotty-first/.cabal-sandbox/share/x86_64-osx-ghc-7.10.1/vanpool-0.1.0.0"
libexecdir = "/Users/gpeterson/code/haskell/scotty-first/.cabal-sandbox/libexec"
sysconfdir = "/Users/gpeterson/code/haskell/scotty-first/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "vanpool_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "vanpool_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "vanpool_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "vanpool_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "vanpool_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
