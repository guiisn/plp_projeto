defmodule Simulador do
  alias Reaxive.Rx

  def call do
    videos = [
      %{title: "Novo vídeo 1", url: "https://www.youtube.com/watch?v=kZv33GazxlU"},
      %{title: "Novo vídeo 2", url: "https://www.youtube.com/watch?v=kZv33GazxlU"},
      %{title: "Novo vídeo 3", url: "https://www.youtube.com/watch?v=kZv33GazxlU"},
      %{title: "Novo vídeo 4", url: "https://www.youtube.com/watch?v=kZv33GazxlU"},
      %{title: "Novo vídeo 5", url: "https://www.youtube.com/watch?v=kZv33GazxlU"},
      %{title: "Novo vídeo 6", url: "https://www.youtube.com/watch?v=kZv33GazxlU"},
      %{title: "Novo vídeo 7", url: "https://www.youtube.com/watch?v=kZv33GazxlU"},
      %{title: "Novo vídeo 8", url: "https://www.youtube.com/watch?v=kZv33GazxlU"},
      %{title: "Novo vídeo 9", url: "https://www.youtube.com/watch?v=kZv33GazxlU"},
      %{title: "Novo vídeo 10", url: "https://www.youtube.com/watch?v=kZv33GazxlU"}
    ]

    channel =
      IO.gets(
        "Escolha o canal que deseja se inscrever:\n[1]: Canal do Guilherme\n[2]: Canal do Thiago\n-> "
      )

    case channel do
      "1\n" ->
        IO.puts(
          "\nInscrito no canal do Guilherme, aguarde enquanto buscamos os novos vídeos dele.\n"
        )

      _ ->
        IO.puts("\nInscrito no canal do Thiago,aguarde enquanto buscamos os novos vídeos dele.\n")
    end

    # observable
    obs =
      videos
      |> Rx.generate()
      |> Rx.map(fn value -> value end)
      |> Rx.async()

    # format output and simulate seek time
    func = fn ele ->
      Process.sleep(1000)
      IO.puts("\n#{ele.title}: #{ele.url}")
    end

    # subscriber
    obs
    |> Rx.stream()
    |> Enum.to_list()
    |> Enum.each(fn ele -> func.(ele) end)
  end
end
