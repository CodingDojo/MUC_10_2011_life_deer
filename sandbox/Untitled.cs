using System.Collections.Generic;
using System;

public class Untitled
{}

public class Grid
{
    public Grid(int height, int width, List<bool> cells)
    {
        this.Height = height;
        this.Width = width;
        this.Cells = cells;
    }
    
    public int Width {get;set;}
    public int Height {get;set;}
    public List<bool> Cells {get;set;}
    
    public List<bool> GetNeighbors(int position)
    {
        List<bool> results = new List<bool>();
        if (Cells == null) 
        {
            return results;
        }

        results.Add(GetNeighborNW(position));
        results.Add(GetNeighborN(position));
        results.Add(GetNeighborNE(position));
        results.Add(GetNeighborW(position));
        results.Add(GetNeighborE(position));
        results.Add(GetNeighborSW(position));
        results.Add(GetNeighborS(position));
        results.Add(GetNeighborSE(position));

        return results;
    }
    
    public bool IsAlive(int position)
    {
        if (this.Cells == null) return false;
        
        if (position < 0) return false;
        
        if (position > this.Cells.Count) return false;
        
        return this.Cells[position -1];
    }

    public bool GetNeighborNW(int position)
    {
        return IsAlive(position - this.Width - 1);
    }

    public bool GetNeighborN(int position)
    {
        return IsAlive(position - this.Width);
    }

    public bool GetNeighborNE(int position)
    {
        return IsAlive(position - this.Width + 1);
    }

    public bool GetNeighborW(int position)
    {
        return IsAlive(position - 1);
    }
    public bool GetNeighborE(int position)
    {
        return IsAlive(position + 1);
    }
    public bool GetNeighborSW(int position)
    {
        return IsAlive(position + this.Width - 1);
    }
    public bool GetNeighborS(int position)
    {
        return IsAlive(position + this.Width);
    }
    public bool GetNeighborSE(int position)
    {
        return IsAlive(position + this.Width + 1);
    }


}

