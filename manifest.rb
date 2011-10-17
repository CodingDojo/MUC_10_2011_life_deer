{:visible_files=>{"cyberdojo.sh"=>{:scroll_left=>"0", :content=>"gmcs -t:library Untitled.cs\nif [ $? -eq 0 ]; then\n  gmcs -t:library -r:Untitled.dll -r:nunit.framework.dll UntitledTest.cs\n  if [ $? -eq 0 ]; then\n    nunit-console -nologo UntitledTest.dll\n  fi\nfi\n\n", :caret_pos=>"0", :scroll_top=>"0"}, "output"=>{:scroll_left=>"0", :content=>"Untitled.cs(22,74): error CS1061: Type `System.Collections.Generic.List<bool>' does not contain a definition for `Where' and no extension method `Where' of type `System.Collections.Generic.List<bool>' could be found (are you missing a using directive or an assembly reference?)\nCompilation failed: 1 error(s), 0 warnings\n", :caret_pos=>"413", :scroll_top=>"0"}, "Untitled.cs"=>{:scroll_left=>"0", :content=>"using System.Collections.Generic;\nusing System;\n\npublic class GameOfLife\n{\n    \n    public GameOfLife(Grid grid)\n    {\n        this.GoLGrid = grid;\n    }\n\n    public Grid GoLGrid {get;set;} \n\n    public Grid GetNextGeneration()\n    {\n        List<bool> results = new List<bool>();\n        Grid grid = new Grid(GoLGrid.Width, GoLGrid.Height, results);\n        \n        for  (int i = 0; i < GoLGrid.Cells.Count; i++)\n        {\n            int position = i + 1;\n            int numberOfLivingNeighbors = GoLGrid.GetNeighbors(position).Where(x => x == true).Count();\n            if (GoLGrid.IsAlive(position))\n            {\n                if (numberOfLivingNeighbors  < 2)\n                {\n                    results[i] = false; //dead\n                }\n                if (numberOfLivingNeighbors > 3)\n                {\n                    results[i] = false; //dead\n                }\n                //remains alive\n            }\n            else\n            {\n                if (numberOfLivingNeighbors == 3)\n                {\n                    results[i] = true; //alive\n                }\n            }\n        }\n    }\n}\n\npublic class Grid\n{\n    public Grid(int height, int width, List<bool> cells)\n    {\n        this.Height = height;\n        this.Width = width;\n        this.Cells = cells;\n    }\n    \n    public int Width {get;set;}\n    public int Height {get;set;}\n    public List<bool> Cells {get;set;}\n    \n    \n\n    public List<bool> GetNeighbors(int position)\n    {\n        List<bool> results = new List<bool>();\n        if (Cells == null) \n        {\n            return results;\n        }\n\n        results.Add(GetNeighborNW(position));\n        results.Add(GetNeighborN(position));\n        results.Add(GetNeighborNE(position));\n        results.Add(GetNeighborW(position));\n        results.Add(GetNeighborE(position));\n        results.Add(GetNeighborSW(position));\n        results.Add(GetNeighborS(position));\n        results.Add(GetNeighborSE(position));\n\n        return results;\n    }\n    \n    public bool IsAlive(int position)\n    {\n        if (this.Cells == null) return false;\n        \n        if (position < 0) return false;\n        \n        if (position > this.Cells.Count) return false;\n        \n        return this.Cells[position -1];\n    }\n\n    public bool GetNeighborNW(int position)\n    {\n        return IsAlive(position - this.Width - 1);\n    }\n\n    public bool GetNeighborN(int position)\n    {\n        return IsAlive(position - this.Width);\n    }\n\n    public bool GetNeighborNE(int position)\n    {\n        return IsAlive(position - this.Width + 1);\n    }\n\n    public bool GetNeighborW(int position)\n    {\n        return IsAlive(position - 1);\n    }\n    public bool GetNeighborE(int position)\n    {\n        return IsAlive(position + 1);\n    }\n    public bool GetNeighborSW(int position)\n    {\n        return IsAlive(position + this.Width - 1);\n    }\n    public bool GetNeighborS(int position)\n    {\n        return IsAlive(position + this.Width);\n    }\n    public bool GetNeighborSE(int position)\n    {\n        return IsAlive(position + this.Width + 1);\n    }\n}\n\n", :caret_pos=>"1007", :scroll_top=>"275"}, "UntitledTest.cs"=>{:scroll_left=>"20", :content=>"using System.Collections.Generic;\nusing System.Linq.Expressions;\nusing System.Linq;\nusing NUnit.Framework;\n\n[TestFixture]\npublic class UntitledTest\n{\n    [Test]\n    public void GridWithoutGivenCellsReturnsNoNeighbors()\n    {\n        Grid grid = new Grid(3,3, null);\n        List<bool> result = grid.GetNeighbors(1);\n        Assert.AreEqual(0, result.Count);\n    }\n    \n    [Test]\n    public void GivenAGridWithALivingCellAtStartingPositionReturnsItsValueWhenAsked()\n    {\n        Grid grid = new Grid(1,1, new List<bool> {true});\n        Assert.AreEqual(true, grid.IsAlive(1));\n    }\n\n    [Test]\n    public void GivenAGridWithADeadCellReturnsItsValueWhenAsked()\n    {\n        Grid grid = new Grid(1,3, new List<bool> {false, true, false});\n        Assert.AreEqual(false, grid.IsAlive(1));\n    }\n    [Test]\n    public void GetNeighborNReturnsTrue()\n    {\n        Grid grid = new Grid(3,3, new List<bool> {false, true, false, false, false, false, false, false, false  });\n        Assert.AreEqual(true, grid.GetNeighborN(5));\n    }\n\n    [Test]\n    public void GetNeighborNReturnsFalse()\n    {\n        Grid grid = new Grid(3,3, new List<bool> {false, true, false, false, false, false, false, false, false  });\n        Assert.AreEqual(false, grid.GetNeighborN(6));\n    }\n\n    [Test]\n    public void GetNeighborWith2LivingNeighborsReturnsThem()\n    {\n        Grid grid = new Grid(3,3, new List<bool> {false, true, true, false, false, false, false, false, false  });\n        Assert.AreEqual(2, grid.GetNeighbors(5).Where(x => x == true).Count());\n    }\n\n    [Test]\n    public void GetNeighborWith1LivingNeighborsReturnsOne()\n    {\n        Grid grid = new Grid(3,3, new List<bool> {true, true, false, false, false, false, false, false, false  });\n        Assert.AreEqual(1, grid.GetNeighbors(6).Where(x => x == true).Count());\n    }\n\n\n\n\n\n    \n\n}\n\n", :caret_pos=>"1771", :scroll_top=>"737"}, "instructions"=>{:scroll_left=>"0", :content=>"Your task is to write a program to calculate the next\ngeneration of Conway's game of life, given any starting\nposition. You start with a two dimensional grid of cells, \nwhere each cell is either alive or dead. The grid is finite, \nand no life can exist off the edges. When calculating the \nnext generation of the grid, follow these four rules:\n\n1. Any live cell with fewer than two live neighbours dies, \n   as if caused by underpopulation.\n2. Any live cell with more than three live neighbours dies, \n   as if by overcrowding.\n3. Any live cell with two or three live neighbours lives \n   on to the next generation.\n4. Any dead cell with exactly three live neighbours becomes \n   a live cell.\n\nExamples: * indicates live cell, . indicates dead cell\n\nExample input: (4 x 8 grid)\n4 8\n........\n....*...\n...**...\n........\n\nExample output:\n4 8\n........\n...**...\n...**...\n........\n\n", :caret_pos=>"344", :scroll_top=>"0"}}, :output=>"Untitled.cs(22,74): error CS1061: Type `System.Collections.Generic.List<bool>' does not contain a definition for `Where' and no extension method `Where' of type `System.Collections.Generic.List<bool>' could be found (are you missing a using directive or an assembly reference?)\nCompilation failed: 1 error(s), 0 warnings\n", :current_filename=>"output"}
