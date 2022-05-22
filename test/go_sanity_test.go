package test

import (
	"fmt"
	"testing"
)

func TestGoIsWorking(t *testing.T) {
	t.Parallel()
	fmt.Println()
	fmt.Println("If you see this text, it's working!")
	fmt.Println()
}
