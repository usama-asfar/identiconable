defmodule Identiconable do
  def main(input, size) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map(size)
    |> draw_image(size)
  end

  defp draw_image(%Identiconable.Image{color: color, pixel_map: pixel_map}, size) do
    image = :egd.create(size, size)
    fill = :egd.color(color)

    Enum.each(pixel_map, fn {start, stop} ->
      :egd.filledRectangle(image, start, stop, fill)
    end)

    :egd.render(image)
  end

  defp build_pixel_map(%Identiconable.Image{grid: grid} = image, size) do
    size = round(size / 5)

    pixel_map =
      Enum.map(grid, fn {_code, index} ->
        horizontal = rem(index, 5) * size
        vertical = div(index, 5) * size

        top_left = {horizontal, vertical}
        bottom_right = {horizontal + size, vertical + size}

        {top_left, bottom_right}
      end)

    %Identiconable.Image{image | pixel_map: pixel_map}
  end

  defp filter_odd_squares(%Identiconable.Image{grid: grid} = image) do
    grid =
      Enum.filter(grid, fn {code, _index} ->
        rem(code, 2) == 0
      end)

    %Identiconable.Image{image | grid: grid}
  end

  defp build_grid(%Identiconable.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk_every(3, 3, :discard)
      |> Enum.map(&mirror_row/1)
      |> List.flatten()
      |> Enum.with_index()

    %Identiconable.Image{image | grid: grid}
  end

  defp mirror_row([first, second | _tail] = row) do
    row ++ [second, first]
  end

  defp pick_color(%Identiconable.Image{hex: [r, g, b | _tail]} = image) do
    %Identiconable.Image{image | color: {r, g, b}}
  end

  defp hash_input(input) do
    hex =
      :crypto.hash(:md4, input)
      |> :binary.bin_to_list()

    %Identiconable.Image{hex: hex}
  end
end
