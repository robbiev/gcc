// Copyright 2011 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//go:build serenity

package poll

import "syscall"

// SendFile is not yet supported for SerenityOS
func SendFile(dstFD *FD, src int, pos, remain int64) (int64, error) {
	return 0, syscall.EINTR
}
