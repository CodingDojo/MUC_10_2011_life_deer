using System.Collections.Generic;
using NUnit.Framework;

[TestFixture]
public class UntitledTest
{
    [Test]
    public void GridWithoutGivenCellsReturnsNoNeighbors()
    {
        Grid grid = new Grid(3,3, null);
        List<bool> result = grid.GetNeighbors(1);
        Assert.AreEqual(0, result.Count);
    }
    
    [Test]
    public void GivenAGridWithALivingCellAtStartingPositionReturnsItsValueWhenAsked()
    {
        Grid grid = new Grid(1,1, new List<bool> {true});
        Assert.AreEqual(true, grid.IsAlive(1));
    }

    [Test]
    public void GivenAGridWithADeadCellReturnsItsValueWhenAsked()
    {
        Grid grid = new Grid(1,3, new List<bool> {false, true, false});
        Assert.AreEqual(false, grid.IsAlive(1));
    }
    [Test]
    public void GetNeighborNReturnsTrue()
    {
        Grid grid = new Grid(3,3, new List<bool> {false, true, false, false, false, false, false, false, false  });
        Assert.AreEqual(true, grid.GetNeighborN(5));
    }

    [Test]
    public void GetNeighborNReturnsFalse()
    {
        Grid grid = new Grid(3,3, new List<bool> {false, true, false, false, false, false, false, false, false  });
        Assert.AreEqual(false, grid.GetNeighborN(6));
    }






    

}

